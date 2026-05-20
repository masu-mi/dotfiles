target    ?= $(HOME)
src_root  ?= $(PWD)
src_vim   := $(src_root)/vim
src_vscode := $(src_root)/vscode-user
src_claude := $(src_root)/claude
src_opencode := $(src_root)/opencode

# default target -> help
.PHONY: help
help:

# Directories
local_dirs  := $(addprefix $(target)/local/, bin lib doc config)
target_dirs := $(target)/works $(target)/.local \
               $(local_dirs) \
               $(target)/.config/nvim/ \
               $(target)/.config/vim/

# Home dotfiles: $(HOME)/.foo -> home/foo
home_files  := $(sort $(notdir $(wildcard $(src_root)/home/*)))
dst_home    := $(addprefix $(target)/., $(home_files))

# Vim / Neovim
DST_NVIM    := $(addprefix $(target)/.config/nvim/, rc init.vim)
DST_VIM     := $(addprefix $(target)/.config/vim/, rc)
DST_VIMRC   := $(target)/.vimrc

# Prompt plugin repos
DST_REPO    := $(addprefix $(target)/, tmux-powerline powerlevel10k)

## Setup
.PHONY: init
init: ## Initialize all settings
init: install_prompt_plugins install_pip_pkgs submodule_init \
      ln_mise ln_vscode ln_claude ln_opencode all

.PHONY: all
all: $(DST_NVIM) $(DST_VIM) $(DST_VIMRC) \
     $(dst_home) \
     $(target)/local/config/powerline.conf
all: $(target_dirs)

$(target_dirs):
	mkdir -p $@

$(dst_home): $(target)/.%: $(src_root)/home/%
	ln -s $< $@

.PHONY: link_home
link_home: $(dst_home) ## Symlink all home dotfiles

.PHONY: rm_home
rm_home: # Remove all home dotfile symlinks
	rm -f $(dst_home)

$(DST_NVIM): | $(target)/.config/nvim/
	ln -sfn $(src_vim)/$(notdir $@) $@

$(DST_VIM): | $(target)/.config/vim/
	ln -sfn $(src_vim)/$(notdir $@) $@

$(DST_VIMRC): $(src_vim)/init.vim
	ln -s $< $@

.PHONY: rm_vim
rm_vim: # Remove vim/nvim config symlinks
	rm -f $(DST_VIMRC) $(DST_NVIM) $(DST_VIM)

$(target)/.config/mise/config.toml: $(src_root)/mise.toml | $(target)/.config/mise
	ln -s $< $@

$(target)/.config/mise:
	mkdir -p $@

.PHONY: ln_mise
ln_mise: $(target)/.config/mise/config.toml

.PHONY: rm_mise
rm_mise: # Remove mise config symlink
	rm -f $(target)/.config/mise/config.toml

# VSCode
.PHONY: ln_vscode
ln_vscode: ## Symlink vscode-user/ -> Code/User (directory-level)
	@set -e; \
	vscode_dir="$(target)/Library/Application Support/Code/User"; \
	runtime_dirs="History globalStorage snippets sync workspaceStorage"; \
	if [ -d "$$vscode_dir" ] && [ ! -L "$$vscode_dir" ]; then \
		echo "  Backing up runtime dirs and moving old config..."; \
		tmpdir=$$(mktemp -d); \
		for d in $$runtime_dirs; do \
			if [ -e "$$vscode_dir/$$d" ]; then \
				mv "$$vscode_dir/$$d" "$$tmpdir/"; \
			fi; \
		done; \
		bak="$$vscode_dir.bak.$$(date +%Y%m%d%H%M%S)"; \
		mv "$$vscode_dir" "$$bak"; \
		echo "  Old config backed up to $$bak"; \
		ln -sfn "$(src_vscode)" "$$vscode_dir"; \
		for d in $$runtime_dirs; do \
			if [ -e "$$tmpdir/$$d" ]; then \
				mv "$$tmpdir/$$d" "$$vscode_dir/"; \
			fi; \
		done; \
		rm -rf "$$tmpdir"; \
		echo "  [LINK] $$vscode_dir -> $(src_vscode)"; \
	elif [ -L "$$vscode_dir" ]; then \
		ln -sfn "$(src_vscode)" "$$vscode_dir"; \
		echo "  [LINK] $$vscode_dir -> $(src_vscode)"; \
	else \
		mkdir -p "$$(dirname "$$vscode_dir")"; \
		ln -sfn "$(src_vscode)" "$$vscode_dir"; \
		echo "  [LINK] $$vscode_dir -> $(src_vscode)"; \
	fi

.PHONY: rm_vscode
rm_vscode: ## Remove VSCode config symlink
	@set -e; \
	vscode_dir="$(target)/Library/Application Support/Code/User"; \
	if [ -L "$$vscode_dir" ]; then \
		rm -f "$$vscode_dir"; \
	fi

# Claude Code
claude_dir   := $(target)/.claude
claude_links := skills agents

.PHONY: ln_claude
ln_claude: ## Symlink claude/skills and claude/agents into ~/.claude
	@mkdir -p "$(claude_dir)"; \
	for name in $(claude_links); do \
		ln -sfn "$(src_claude)/$$name" "$(claude_dir)/$$name"; \
		echo "  [LINK] $(claude_dir)/$$name -> $(src_claude)/$$name"; \
	done

.PHONY: rm_claude
rm_claude: ## Remove ~/.claude/skills and ~/.claude/agents symlinks
	@for name in $(claude_links); do \
		if [ -L "$(claude_dir)/$$name" ]; then \
			rm -f "$(claude_dir)/$$name"; \
			echo "  [UNLINK] $(claude_dir)/$$name"; \
		fi; \
	done

# OpenCode
opencode_dir   := $(target)/.config/opencode
opencode_links := skills agents tools

.PHONY: ln_opencode
ln_opencode: ## Symlink opencode/skills, agents, tools into ~/.config/opencode
	@mkdir -p "$(opencode_dir)"; \
	for name in $(opencode_links); do \
		ln -sfn "$(src_opencode)/$$name" "$(opencode_dir)/$$name"; \
		echo "  [LINK] $(opencode_dir)/$$name -> $(src_opencode)/$$name"; \
	done

.PHONY: rm_opencode
rm_opencode: ## Remove ~/.config/opencode/skills, agents, tools symlinks
	@for name in $(opencode_links); do \
		if [ -L "$(opencode_dir)/$$name" ]; then \
			rm -f "$(opencode_dir)/$$name"; \
			echo "  [UNLINK] $(opencode_dir)/$$name"; \
		fi; \
	done

$(target)/local/config/powerline.conf: | install_pip_pkgs
	mkdir -p $(dir $@)
	ln -s $$(pip3 show powerline-status | awk '/^Location/{print $$2}')/powerline/bindings/tmux/powerline.conf $@

.PHONY: rm_powerline
rm_powerline: # Remove powerline config symlink
	rm -f $(target)/local/config/powerline.conf

$(DST_REPO):
	test -d $@ || git clone \
	    $(if $(findstring powerlevel10k,$@),--depth=1 https://github.com/romkatv/powerlevel10k.git,https://github.com/jedipunkz/tmux-powerline.git) $@

.PHONY: install_prompt_plugins
install_prompt_plugins: $(DST_REPO) ## Clone prompt plugin repos


.PHONY: submodule_init
submodule_init: ## Init git submodules
	git submodule update --init --recursive

.PHONY: install_pip_pkgs
install_pip_pkgs: ## Install pip packages
	pip3 install -r $(src_root)/requirements.txt


## Clean
.PHONY: clean
clean: rm_vim rm_home rm_powerline rm_mise rm_vscode rm_claude rm_opencode ## Remove all symlinks

## Help
help: ## Show this help
	@echo ''
	@echo 'Usage:  make <target>'
	@echo ''
	@awk 'BEGIN {FS = ":.*?## "} \
		/^[a-zA-Z0-9_-]+:.*?## / {printf "    %-20s%s\n", $$1, $$2} \
		/^## / {printf "  %s\n", substr($$1, 4)}' \
		$(MAKEFILE_LIST)
	@echo ''


.PHONY: show_dirs
show_dirs: ## Show directories to be created
	@echo $(target_dirs)

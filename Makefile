.PHONY: help
help:

target    ?= $(HOME)
src_root    ?= $(PWD)
src_vim_conf := $(src_root)/vim

## Handle $HOME/.*
local_dir := $(addprefix $(target)/local/, bin lib doc config)
target_dirs   := $(target)/works $(target)/.local $(local_dir)
$(target_dirs):
	mkdir -p $@

src_home_config_base := $(notdir $(shell ls ./home))
dst_home_conf      := $(addprefix $(target)/., $(src_home_config_base))

$(dst_home_conf): $(addprefix $(src_root)/home/, $(BASE:.%=%))
	$(eval BASE := $(notdir $@))
	$(eval SRC := $(addprefix $(src_root)/home/, $(BASE:.%=%)))
	ln -s $(SRC) $@

.PHONY: link_home_conf
link_home_conf: $(dst_home_conf) ## Make link files under $HOME/
.PHONY: rm_home_conf
rm_home_conf: ## Remove config file links don't related to (n)vim
	rm -f $(dst_home_conf)

## Handle vim/nvim conf
dst_nvim := $(target)/.config/nvim/
target_dirs += $(dst_nvim)
dst_vim := $(target)/.config/vim/
target_dirs += $(dst_vim)

DST_NVIM_CONF      := $(addprefix $(dst_nvim), rc init.vim)
$(DST_NVIM_CONF): $(dst_nvim)
	ln -s $(src_vim_conf)/$(notdir $@) $@

DST_VIM_CONF       := $(addprefix $(dst_vim), rc)
$(DST_VIM_CONF): $(dst_vim)
	ln -s $(src_vim_conf)/$(notdir $@) $@

DST_HOME_VIM_CONF  := $(target)/.vimrc
$(DST_HOME_VIM_CONF): $(src_vim_conf)/init.vim
	ln -s $< $@

.PHONY: rm_vims_conf
rm_vims_conf: ## Remove links to vim config
	rm -f $(DST_HOME_VIM_CONF) $(DST_NVIM_CONF) $(DST_VIM_CONF)


## Handle mise
$(target)/.config/mise:
	mkdir -p $@
$(target)/.config/mise/config.toml: $(src_root)/mise.toml $(target)/.config/mise
	ln -s $< $@

.PHONY: ln_mise
ln_mise: $(target)/.config/mise/config.toml

.PHONY: rm_mise
rm_mise: ## remove mise conf
	rm -f $(target)/.config/mise/config.toml

## Handle plugins
.PHONY: submodule_init
submodule_init: ## currently nothing to do
	git submodule update --init --recursive

.PHONY: install_pip_pkgs
install_pip_pkgs: ## install pip3 pkgs
	pip3 install -r $(src_root)/requirements.txt

DST_PROMPT_REPO := $(addprefix $(target)/, tmux-powerline powerlevel10k)
.PHONY: install_prompt_plugins
install_prompt_plugins: $(DST_PROMPT_REPO) ## install some plugins for prompts

$(target)/local/config/powerline.conf: $(target)/local/config
	$(eval SRC_PREFIX := $(shell pip3 show powerline-status | awk '/^Location/{print $$2 }' ))
	$(eval SRC := $(SRC_PREFIX)/powerline/bindings/tmux/powerline.conf)
	ln -s $(SRC) $@
.PHONE: rm_powerline
rm_powerline:
	rm -f $(target)/local/config/powerline.conf

$(target)/tmux-powerline:
	git clone https://github.com/jedipunkz/tmux-powerline.git $@

$(target)/powerlevel10k:
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $@

## Main
.PHONY: init
init: ## Initialize all settings
init: install_prompt_plugins \
	install_pip_pkgs \
	submodule_init \
	ln_mise \
	all

.PHONY: all
all: $(DST_NVIM_CONF) $(DST_VIM_CONF) $(DST_HOME_VIM_CONF) \
	$(dst_home_conf) \
	$(target_dirs) \
	$(target)/local/config/powerline.conf

.PHONE: clean
clean: rm_vims_conf rm_home_conf rm_powerline ## Remove all links

## Help:
.PHONY: show_dirs
show_dirs: ## Show directories to be created
	@echo $(target_dirs)

help: ## Show this help.
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} { \
		if (/^[a-zA-Z0-9_-]+:.*?##.*$$/) {printf "    ${YELLOW}%-20s${GREEN}%s${RESET}\n", $$1, $$2} \
		else if (/^## .*$$/) {printf "  ${CYAN}%s${RESET}\n", substr($$1,4)} \
		}' $(MAKEFILE_LIST)


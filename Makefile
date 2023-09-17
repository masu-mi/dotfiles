TARGET_HOME    ?= $(HOME)
CONFIG_ROOT    ?= $(PWD)
CONFIG_VIM_DIR := $(CONFIG_ROOT)/vim

SRC_HOME_CONF_BASE := $(notdir $(shell ls ./home))
DST_HOME_CONF      := $(addprefix $(TARGET_HOME)/., $(SRC_HOME_CONF_BASE))

SRC_NVIM_CONF_BASE := rc init.vim
DST_NVIM_CONF      := $(addprefix $(TARGET_HOME)/.config/nvim/, $(SRC_NVIM_CONF_BASE))
SRC_VIM_CONF_BASE  := rc
DST_VIM_CONF       := $(addprefix $(TARGET_HOME)/.config/vim/, $(SRC_VIM_CONF_BASE))
DST_VIMS_CONF      := $(DST_NVIM_CONF) $(DST_VIM_CONF)
DST_HOME_VIM_CONF  := $(TARGET_HOME)/.vimrc

LOCAL_DIR     := $(addprefix $(TARGET_HOME)/local/, bin lib doc config)
DST_DIR := $(call uniq, $(TARGET_HOME)/works $(VIMS_CONF_DIR) $(LOCAL_DIR))
DST_PROMPT_REPO := $(addprefix $(TARGET_HOME)/, tmux-powerline powerlevel10k)

.PHONY: help
help:

## Setup
.PHONY: init
init: install_prompt_plugins \ ## Initialize all settings
	install_pip_pkgs \
	submodule_init \
	all

.PHONY: all
all: $(DST_VIMS_CONF) $(DST_HOME_VIM_CONF) \
	$(DST_HOME_CONF) \
	$(DST_DIR) \
	$(TARGET_HOME)/local/config/powerline.conf

.PHONY: submodule_init
submodule_init: ## currently nothing to do
	git submodule update --init --recursive

.PHONY: link_home_conf
link_home_conf: $(DST_HOME_CONF) ## Make link files under $HOME/

.PHONY: install_prompt_plugins
install_prompt_plugins: $(DST_PROMPT_REPO) ## install some plugins for prompts

.PHONY: install_pip_pkgs
install_pip_pkgs: ## install pip3 pkgs
	pip3 install -r $(CONFIG_ROOT)/requirements.txt

## Clean
.PHONE: clean
clean: rm_vims_conf rm_home_conf ## Remove all links

.PHONY: rm_vims_conf
rm_vims_conf: ## Remove links to vim config
	rm $(DST_HOME_VIM_CONF) $(DST_VIMS_CONF)

.PHONY: rm_home_conf
rm_home_conf: ## Remove config file links don't related to (n)vim
	rm $(DST_HOME_CONF)

define uniq =
  $(eval seen :=)
  $(foreach _,$1,$(if $(filter $_,${seen}),,$(eval seen += $_)))
  ${seen}
endef

VIMS_CONF_DIR := $(dir $(DST_VIMS_CONF))

$(DST_HOME_CONF): $(addprefix $(CONFIG_ROOT)/home/, $(BASE:.%=%))
	$(eval BASE := $(notdir $@))
	$(eval SRC := $(addprefix $(CONFIG_ROOT)/home/, $(BASE:.%=%)))
	ln -s $(SRC) $@

$(DST_DIR):
	mkdir -p $@

$(DST_VIMS_CONF): $(VIMS_CONF_DIR)
	ln -s $(CONFIG_VIM_DIR)/$(notdir $@) $@

$(DST_HOME_VIM_CONF): $(CONFIG_VIM_DIR)/init.vim
	ln -s $< $@

$(TARGET_HOME)/local/config/powerline.conf:
	$(eval SRC_PREFIX := $(shell pip3 show powerline-status | awk '/^Location/{print $$2 }' ))
	$(eval SRC := $(SRC_PREFIX)/powerline/bindings/tmux/powerline.conf)
	ln -s $(SRC) $@


$(TARGET_HOME)/tmux-powerline:
	git clone https://github.com/jedipunkz/tmux-powerline.git $@

$(TARGET_HOME)/powerlevel10k:
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $@

## Help:

.PHONY: show_dirs
show_dirs: ## Show directories to be created
	@echo $(DST_DIR)

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


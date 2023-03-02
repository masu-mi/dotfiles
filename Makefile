TARGET_HOME ?= $(HOME)
CONFIG_ROOT  ?= $(PWD)

DIRS := local/bin local/lib local/doc local/config \
	.backup/vim .config \
	works \
	.config/vim .config/nvim
TARGET_DIR := $(addprefix $(TARGET_HOME)/, $(DIRS))

CONF_FILES := .ackrc .bashrc .bash_profile .ctags.d .gitconfig \
	.inputrc .screenrc .tmux.conf .zshrc .sqliterc
TARGET_CONF_FILES := $(addprefix $(TARGET_HOME)/, $(CONF_FILES))

NVIM_LINKS := rc init.vim
TARGET_NVIM_LINKS := $(addprefix $(TARGET_HOME)/.config/nvim/, $(NVIM_LINKS))

VIM_LINKS := rc
TARGET_VIM_LINKS := $(addprefix $(TARGET_HOME)/.config/vim/, $(VIM_LINKS))

TARGET_VIM_INIT := $(TARGET_HOME)/.vimrc

TARGET_MEMO := $(TARGET_HOME)/.config/memo

.PHONY: all

all: $(TARGET_DIR) \
	$(TARGET_CONF_FILES) $(TARGET_MEMO) \
	$(TARGET_VIM_LINKS) $(TARGET_VIM_INIT) $(TARGET_NVIM_LINKS) \
	submodule_init


$(TARGET_DIR):
	mkdir -p $@

$(TARGET_CONF_FILES):
	ln -s $(CONFIG_ROOT)/$(notdir $@) $@

$(TARGET_NVIM_LINKS) $(TARGET_VIM_LINKS):
	ln -s $(CONFIG_ROOT)/vim/$(notdir $@) $@

$(TARGET_VIM_INIT):
	ln -s $(CONFIG_ROOT)/vim/init.vim $@

$(TARGET_MEMO):
	ln -s $(CONFIG_ROOT)/memo $@


.PHONY: submodule_init
submodule_init:
	git submodule update --init --recursive

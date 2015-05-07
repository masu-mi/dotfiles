#!/usr/bin/env bash

bind C-l:clear-screen

# 2回/etc/profile読み込むのを避ける
[ -f /etc/profile ] && source /etc/profile
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/dotfiles/.bash_lib ]; then
    . ~/dotfiles/.bash_lib
fi
if [ -f ~/dotfiles/.bash_aliases ]; then
    . ~/dotfiles/.bash_aliases
fi

export LANG='ja_JP.UTF-8'
# export LC_ALL='C'
# export LC_CTYPE='C'
# export LC_MESSAGES='jp_JP.UTF-8'

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go

add_path "/opt/X11/bin"
add_path "${HOME}/pear/bin"
add_path "/usr/local/sbin"
add_path "/usr/local/bin"
add_path "/usr/share/colorgcc"
add_path "${HOME}/.cabal/bin"
add_path "${HOME}/.local/bin"
add_path "${HOME}/bin"
add_path "${HOME}/local/bin"
add_path "$GOROOT/bin"
add_path "$GOPATH/bin"

# for different option
. ~/dotfiles/.bashrc.$(uname)

export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/usr/local/include"
export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/usr/local/include/ImageMagick"
export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/usr/local/include/mysql"
export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/usr/local/include/freetype"

export LIBRARY_PATH="${LIBRARY_PATH}:/usr/local/lib"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib"
export DYLD_FALLBACK_LIBRARY_PATH="/usr/local/lib"

export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/lib/pkgconfig"
export CLASSPATH=".:/usr/java/default/lib/:/usr/share/java/junit.jar"

export CVSEDITOR=vim
export EDITOR='vim'
export SVN_EDITOR='vim'
export PAGER='lv -la -c -Ou8'

export RSYNC_RSH=ssh
export CVS_RSH=ssh

. $HOME/dotfiles/.bash_prompt

export HISTSIZE=2000


# for python
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
source $(which virtualenvwrapper.sh)
WORKON_HOME=${HOME}/.virtualenvs
#パッケージをvirtualenv環境下にインストール
export PIP_RESPECT_VIRTUALENV=true


# for Ruby, PHP
add_path "${HOME}/.phpenv/bin"
add_path "$HOME/.rbenv/bin"
eval "$(rbenv init -)"
eval "$(phpenv init -)"
# for Node.js
add_path "${HOME}/.nodebrew/current/bin"

### Added by the Heroku Toolbelt
add_path "/usr/local/heroku/bin"

# boot2docker
export DOCKER_HOST=tcp://localhost:4243

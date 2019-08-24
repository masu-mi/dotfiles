#!/usr/bin/env bash

SRC_TOP=$(cd $(dirname $0)/..; pwd)/vim
TARGET_HOME=${1:-${HOME}}

echo "TARGET: $TARGET_HOME"

mkdir ${TARGET_HOME}/.config/vim
ln -s ${SRC_TOP} ${TARGET_HOME}/.vim
ln -s ${SRC_TOP}/init.vim ${TARGET_HOME}/.vimrc
ln -s ${SRC_TOP}/rc ${TARGET_HOME}/.config/vim/rc

mkdir ${TARGET_HOME}/.config/nvim
ln -s ${SRC_TOP}/init.vim ${TARGET_HOME}/.config/nvim/init.vim
ln -s ${SRC_TOP}/rc ${TARGET_HOME}/.config/nvim/rc
ln -s ${SRC_TOP}/ftplugin ${TARGET_HOME}/.config/nvim/ftplugin

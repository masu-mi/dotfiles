#!/usr/bin/env bash


ver=6.2.9

function ensure-dir {
  if [ ! -d ${1} ] ; then
    mkdir -p ${1}
  fi
}

wget http://tamacom.com/global/global-${ver}.tar.gz
# tar zxvf global-${ver}.tar.gz
# cd global-${ver}
#
# ensure-dir ${HOME}/local/bin
#
# ./configure --prefix=${HOME}/local/
# make && make install
#
# ensure-dir ${HOME}/dotfiles/.vim/plugin
# ln -s ${HOME}/local/share/gtags/gtags.vim ${HOME}/dotfiles/.vim/plugin/gtags.vim

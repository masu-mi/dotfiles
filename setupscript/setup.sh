#!/usr/bin/env bash

mkdir .vim/plugin
# install plugin of gnu global
find /usr/local/ -name *gtags.vim |xargs -I{} ln -s {} /Users/masumi/dotfiles/.vim/plugin/gtags.vim

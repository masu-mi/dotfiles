#!/usr/bin/env bash

# 作業ディレクトリ変更
localdir=$HOME/local
cd $tmpdir;

tmpdir=$(mktemp -t -d temp.XXXXXX)

vim_ver=7.3

info-state() {
  echo `date`"[INFO] current dir:"`pwd`
}

install-vim() {
  info-state
  wget ftp://ftp.vim.org/pub/vim/unix/vim-${vim_ver}.tar.bz2
  bzip2 -d -c vim-${vim_ver}.tar.bz2 |tar xf -
  cd `ls -1 -d vim* |grep -v tar`
  info-state
  ./configure --prefix=$localdir \
              --enable-multibyte \
              --enable-fontset \
              --enable-ctags \
              --enable-pythoninterp \
              --with-python-config-dir=/usr/lib/python2.7/config \
              --enable-rubyinterp \
  && make && make install
}

install-ack() {
  info-state
  # CPAN 前提
  sudo cpan App::Ack
  # 1file版でOKなら以下
  # curl http://beyondgrep.com/ack-2.04-single-file > ~/bin/ack && chmod 0755 !#:3
  info-state
}

install-lv() {
  info-state
}

install-git() {
  info-state
}

install-rlwrap() {
  info-state
}

install-gtags() {
  info-state
}

install-tmux() {
  info-state
}

install-screen() {
  info-state
}


# full install
# (
# install-vim
# )

#mkdir .vim/plugin
## install plugin of gnu global
#find /usr/local/ -name *gtags.vim |xargs -I{} ln -s {} /Users/masumi/dotfiles/.vim/plugin/gtags.vim

#!/usr/bin/env bash

if [ `uname` != Darwin ] ; then
  echo '[WARN] This script is for Darwin.'
  exit
fi
setup_darwin() {
  # install homebrew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  # install ansible
  brew install ansible
  # do ansible
  ansible-playbook -i ./macbook.hosts -vv ./setup-mac.yml
  # setup vim
  vim -s ./setup.vim
  ./mk-virtualenv.sh
}
pre_work() {
  if [ ! -d ~/dotfiles ]; then
    echo '[INFO] git clone git@github.com:masu-mi/dotfiles.git ~/dotfiles'
    git clone git@github.com:masu-mi/dotfiles.git ~/dotfiles
    git submodule update --init
  fi
  if [ ! -d ~/dotfiles/setupscript ]; then
    echo "[FATAL] Dir ~/dotfiles/setupscript don't exists."
    exit 1
  fi
  echo '[INFO] cd ~/dotfiles/setupscript'
  cd ~/dotfiles/setupscript
}
if [ `pwd` == /Users/masumi/dotfiles/setupscript ]; then
  setup_darwin
else
  pre_work
  setup_darwin
fi

### ビルドの基本ツール
install-dev(){
## Ubuntu
  sudo aptitude -y update
  sudo aptitude -y upgrade
  sudo aptitude -y install build-essential
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

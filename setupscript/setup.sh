#!/usr/bin/env bash

# 作業ディレクトリ変更
localdir=$HOME/local
cd $tmpdir;

tmpdir=$(mktemp -t -d temp.XXXXXX)

vim_ver=7.3

info-state() {
  echo `date`"[INFO] current dir:"`pwd`
}

# http://www.vim.org/
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

# http://beyondgrep.com/
install-ack() {
  info-state
  # CPAN 前提
  sudo cpan App::Ack
  # 1file版でOKなら以下
  # curl http://beyondgrep.com/ack-2.04-single-file > ${localdir}/bin/ack && chmod 0755 !#:3
  info-state
}

# http://www.ff.iij4u.or.jp/~nrt/lv/#install
install-lv() {
  info-state
  wget http://www.ff.iij4u.or.jp/~nrt/freeware/lv451.tar.gz
  tar xvzf lv451.tar.gz
  cd `ls -1 -d lv* |grep -v tar`
  info-state
  ./src/configure --prefin=$localdir && make && make install
}

# http://git-scm.com/
install-git() {
  info-state
}

# http://mxcl.github.io/homebrew/
install_homebrew() {
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
}

# http://utopia.knoware.nl/~hlub/rlwrap/#rlwrap
install-rlwrap() {
  info-state
  wget http://utopia.knoware.nl/~hlub/rlwrap/rlwrap-0.37.tar.gz
  tar xvzf rlwrap-0.37.tar.gz
  cd `ls -1 -d rlwrap* |grep -v tar`
  info-state
  ./configure --prefin=$localdir && make && make install
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


full_install(){
  install-vim
  install-lv
  install-rlwrap
}

full_install

#mkdir .vim/plugin
## install plugin of gnu global
#find /usr/local/ -name *gtags.vim |xargs -I{} ln -s {} /Users/masumi/dotfiles/.vim/plugin/gtags.vim

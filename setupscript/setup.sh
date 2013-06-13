#!/usr/bin/env bash

#####################################
# 個人の開発環境を構築するスクリプト
#
# *前提*
# - git
# - Ubuntu|Cent|OSX
#
# *インストールする対象*
# 言語環境
# python,Ruby,Gauche,Node
# ツール
# vim,git,tmux,ack,lv,iconv
#
#####################################

## debug用
info-state() {
  echo `date`"[INFO] current dir:"`pwd`
}


# 個人ツールinstall先の準備
setup-local-dir(){
  localdir=$HOME/local
  if [ ! -d ${localdir} ]; then
    mkdir ${localdir}
    if [ ! -d ${localdir}/bin ]; then
      mkdir ${localdir}/bin
    fi
    if [ ! -d ${localdir}/lib ]; then
      mkdir ${localdir}/lib
    fi
  fi
}


### ビルドの基本ツール
install-dev(){
## Ubuntu
  sudo aptitude -y update
  sudo aptitude -y upgrade
  sudo aptitude -y install build-essential
}

### makeする場所の確保
init-workspace(){
  tmpdir=$(mktemp -t -d ${HOME}/Setup.XXXXXX)
  cd $tmpdir
}

vim_ver=7.3

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
# CPAN 前提
  sudo cpan App::Ack
# 1file版でOKなら以下
  # curl http://beyondgrep.com/ack-2.04-single-file > ${localdir}/bin/ack && chmod 0755 !#:3
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
  # OSX専用
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
}

# http://utopia.knoware.nl/~hlub/rlwrap/#rlwrap
install-rlwrap() {
  info-state
  wget http://utopia.knoware.nl/~hlub/rlwrap/rlwrap-0.37.tar.gz
  tar xvzf rlwrap-0.37.tar.gz
  cd `ls -1 -d rlwrap* |grep -v tar`
  info-state
  ./configure --prefix=$localdir && make && make install
}

install-gtags() {
  info-state
  #mkdir .vim/plugin
  ## install plugin of gnu global
  #find /usr/local/ -name *gtags.vim |xargs -I{} ln -s {} /Users/masumi/dotfiles/.vim/plugin/gtags.vim
}

install-tmux() {
  info-state
}

install-screen() {
  info-state
}

setup_dotfiles() {
  if [ `grep dotfiles $HOME/.bashrc > wc -l` -eq 0 ]; then
    echo ". $HOME/dotfiles/.bashrc" >> $HOME/.bashrc
  else
    echo ".bashrc include $HOME/dotfiles/.bashrc"
  fi
  if [ `grep dotfiles $HOME/.bash_aliases > wc -l` -eq 0 ]; then
    echo ". $HOME/dotfiles/.bash_aliases" >> $HOME/.bash_aliases
  else
    echo ".bash_aliases include $HOME/dotfiles/.bash_aliases"
  fi
  if [ ! -e $HOME/.tmux.conf ]; then
    ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
  else
    echo ".tmux.conf exists"
  fi
  if [ ! -e $HOME/.screenrc ]; then
    ln -s $HOME/dotfiles/.screenrc $HOME/.screenrc
  else
    echo ".screenrc exists"
  fi
  if [ ! -e $HOME/.gitconfig ]; then
    ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
  else
    echo ".gitconfig exists"
  fi
  if [ `grep dotfiles $HOME/.vimrc > wc -l` -eq 0 ]; then
    echo "source $HOME/dotfiles/.vimrc" >> $HOME/.vimrc
  else
    echo ".vimrc include $HOME/dotfiles/.vimrc"
  fi
}

setup_dotfiles

init-workspace
install-dev
install-vim
install-ack
install-lv
install-rlwrap

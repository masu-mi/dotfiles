#!/usr/bin/env bash

# for different option
. ~/dotfiles/.bash_aliases.$(uname)

alias svim='sudo vim -u .vimrc'

alias cd-='cd -'
alias cdproj='cd ${HOME}/Documents/+project'
alias cdwork='cd ${HOME}/work'
alias cd..='cd ..'
alias realcwd='cd -P .'

alias cp='cp -v'
alias mv='mv -iv'
alias rm='rm -iv'

alias sc='screen'
alias bc='bc -p'

alias md='mkdir'
alias ftmux='tmux -2u'

# カレンダー系コマンド
alias cal='cal -m3'

# 開発系
alias g++='g++ -Wall'
alias gcc='gcc -Wall'

alias g='git'

alias lsdrafts='head -n 1 `ls drafts/*.rst`| awk '\''!/^$/{print $0}'\'

# 文字コード変換
alias euc2sjis='iconv -f euc-jp -t sjis'
alias euc2utf='iconv -f euc-jp -t utf-8'
alias sjis2euc='iconv -f sjis   -t euc-jp'
alias sjis2utf='iconv -f sjis   -t utf-8'
alias utf2euc='iconv -f utf-8  -t euc-jp'
alias utf2sjis='iconv -f utf-8  -t sjis'


alias reload='. ~/.bashrc'

alias vivimrc='vim ~/.vimrc'
alias viscreen='vim ~/.screenrn'
alias vitmux='vim ~/.tmux.conf'
alias vibashrc='vim ~/.bashrc'
alias vialiases='vim ~/.bash_aliases'

alias f='pushd'
alias b='popd'

alias lv='lv -c'

alias sc='screen -U -D -RR'

alias sudo='sudo -p "sudo"'

# PHP開発を楽にしたいから
alias lphp='php -d open_basedir=`pwd`'
alias fphp='php -d open_basedir=/'

alias java='java -Dfile.encoding=utf-8'
alias javac='javac -J-Dfile.encoding=utf-8'
alias jar='jar -J-Dfile.encoding=utf-8'
alias jdb='jdb -J-Dfile.encoding=utf-8'

function stvim {
    vim $(which $1)
}

alias pdots='pushd ~/dotfiles'

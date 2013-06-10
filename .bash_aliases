#!/usr/bin/env bash
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


alias tmux='tmux -2u'

# カレンダー系コマンド
alias cal='cal -m3'
alias tomorrow='date -d1day'
alias yesterday='date -d1day+ago'

# 開発系
alias g++='g++ -Wall'
alias gcc='gcc -Wall'

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

# wオプションはosxでの文字化けに関して
alias ls='ls -w'
alias ll='ls -lw'
alias la='ls -aw'
alias lla='ls -law'

alias sc='screen -U -D -RR'

export SSH_AUTH_SOCK=${HOME}/.ssh/auth.sock
alias sa='eval $(ssh-agent -a ${SSH_AUTH_SOCK}) && ssh-add'

alias sudo='sudo -p "sudo"'

# PHP開発を楽にしたいから
alias lphp='php -d open_basedir=`pwd`'

alias java='java -Dfile.encoding=utf-8'
alias javac='javac -J-Dfile.encoding=utf-8'
alias jar='jar -J-Dfile.encoding=utf-8'
alias jdb='jdb -J-Dfile.encoding=utf-8'

function stvim {
    vim $(which $1)
}

# for different option
. ~/dotfiles/.bash_aliases.$(uname)

alias reload='. ~/.bashrc'

alias sudo='sudo -p "sudo"'
alias g='git'

alias f='pushd'
alias b='popd'
alias cd-='cd -'
alias cdwork='cd ${HOME}/works'
alias cd..='cd ..'
alias realcwd='cd -P .'

alias ls='ls -G'
alias md='mkdir'
alias cp='cp -v'
alias mv='mv -i'
alias rm='rm -i'

alias bc='bc -p'
alias cal='cal -m3'

alias lv='lv -c'
alias sc='screen -U -D -RR'
alias ftmux='tmux -2u'

# util of converting char. encoding
alias euc2sjis='iconv -f euc-jp -t sjis'
alias euc2utf='iconv -f euc-jp -t utf-8'
alias sjis2euc='iconv -f sjis   -t euc-jp'
alias sjis2utf='iconv -f sjis   -t utf-8'
alias utf2euc='iconv -f utf-8  -t euc-jp'
alias utf2sjis='iconv -f utf-8  -t sjis'

alias svim='sudo vim -u .vimrc'
function stvim {
    vim $(which $1)
}
alias pdots='pushd ~/dotfiles'
alias lsdrafts='head -n 1 `ls drafts/*.rst`| awk '\''!/^$/{print $0}'\'

alias vivimrc='vim ~/.vimrc'
alias viscreen='vim ~/.screenrn'
alias vitmux='vim ~/.tmux.conf'
alias vibashrc='vim ~/.bashrc'
alias vialiases='vim ~/.bash_aliases'

# for dev
alias g++='g++ -W -Wall'
alias gcc='gcc -W -Wall'
## to make easy check php script
alias lphp='php -d open_basedir=`pwd`'
alias fphp='php -d open_basedir=/'
## change java's output encoding
alias java='java -Dfile.encoding=utf-8'
alias javac='javac -J-Dfile.encoding=utf-8'
alias jar='jar -J-Dfile.encoding=utf-8'
alias jdb='jdb -J-Dfile.encoding=utf-8'

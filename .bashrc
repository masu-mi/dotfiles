bind C-l:clear-screen


export RSYNC_RSH=ssh

export CVS_RSH=ssh
export CVSEDITOR=vim

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


export LANG='ja_JP.UTF-8'
export LC_ALL='C'
export LC_CTYPE='C'
export LC_MESSAGES='jp_JP.UTF-8'

export PATH="/usr/local/bin:${PATH}"
export PATH="/usr/share/colorgcc:${PATH}"
export PATH="${HOME}/bin:${PATH}"

export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/usr/local/include"
## サブパス
export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/usr/local/include/ImageMagick"
export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/usr/local/include/mysql"

export LIBRARY_PATH="${LIBRARY_PATH}:/usr/local/lib"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib"
export DYLD_FALLBACK_LIBRARY_PATH="/usr/local/lib"

export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/lib/pkgconfig"
export CLASSPATH=".:/usr/java/default/lib/:/usr/share/java/junit.jar"

export EDITOR='vim'
export SVN_EDITOR='vim'

export PAGER='lv -c'


export ESC="$(echo -en '\033')"
export COLOR_RED="$(echo -en '\033[31m')"
export COLOR_GREEN="$(echo -en '\033[32m')"
export COLOR_YELLOW="$(echo -en '\033[33m')"
export COLOR_BLUE="$(echo -en '\033[34m')"
export COLOR_CYAN="$(echo -en '\033[35m')"
export COLOR_MAGENTA="$(echo -en '\033[36m')"
export COLOR_WHITE="$(echo -en '\033[37m')"

export COLOR_HEIGHLIGHT_RED="$(echo -en '\033[31;1m')"
export COLOR_HEIGHLIGHT_GREEN="$(echo -en '\033[32;1m')"
export COLOR_HEIGHLIGHT_YELLOW="$(echo -en '\033[33;1m')"
export COLOR_HEIGHLIGHT_BLUE="$(echo -en '\033[34;1m')"
export COLOR_HEIGHLIGHT_CYAN="$(echo -en '\033[35;1m')"
export COLOR_HEIGHLIGHT_MAGENTA="$(echo -en '\033[36;1m')"
export COLOR_HEIGHLIGHT_WHITE="$(echo -en '\033[37;1m')"
export COLOR_DEFAULT="$(echo -en '\033[m')"


PS_USER="\[\e[33m\]\u\[\e[0m\]"
PS_HOST="\[\e[32m\]\h\[\e[0m\]"
PS_WORK="\[\e[37;1m\]\W\[\e[0m\]"
PS_SCREEN=""
PS_SSH=""

if [ -n "${WINDOW}" ] ; then
    PS_SCREEN="(\[\e[35m\]${WINDOW}\[\e[0m\])"
fi
if [ -n "${SSH_CLIENT}" ] ; then
    PS_SSH="(\[\e[36m\]`echo ${SSH_CLIENT} | sed 's/ [0-9]\+ [0-9]\+$//g'`\[\e[0m\])"
fi
export PS1="[${PS_USER}${PS_SCREEN}@${PS_HOST}${PS_SSH} $PS_WORK]\$ "

export HISTSIZE=2000

export LANG='ja_JP.UTF-8'

# for python
source $(which virtualenvwrapper.sh)
WORKON_HOME=${HOME}/.virtualenvs
#パッケージをvirtualenv環境下にインストール
export PIP_RESPECT_VIRTUALENV=true


# for ruby
# for Node
## nodebrew
if [ -f ~/.nodebrew/nodebrew ]; then
    export PATH="${HOME}/.nodebrew/current/bin:${PATH}"
fi
# for PHP
# for Gauche
# for Haskell
# for Scala


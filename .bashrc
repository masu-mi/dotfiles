[ -f /etc/profile ] && . /etc/profile
[ -f /etc/bashrc ]  && . /etc/bashrc
[ -f ~/dotfiles/.bashrc_aliases ] && . ~/dotfiles/.bashrc_aliases

function pathmunge () {
  case ":${PATH}:" in
    *:"$1":*)
      ;;
    *)
      if [ "$2" = "after" ] ; then
        export PATH=$PATH:$1
      else
        export PATH=$1:$PATH
      fi
  esac
}
function add_path {
  if test -d $1; then
    pathmunge $1 $2
  fi
}

export LANG='C'
export HISTSIZE=2000

## setup bash_prompt
. $HOME/dotfiles/.bashrc_prompt

## basic tools
export EDITOR=vim
export SVN_EDITOR=vim
export CVSEDITOR=vim
export CVS_RSH=ssh
export RSYNC_RSH=ssh
if [ -x lv ]; then
  export PAGER='lv -la -c -Ou8'
fi

## add paths
add_path "/opt/X11/bin"
add_path "/usr/local/sbin"
add_path "/usr/local/bin"
add_path "/usr/share/colorgcc"
### local
add_path "${HOME}/bin"
add_path "${HOME}/local/bin"

### specific langages
if [ -d "${HOME}/go" ]; then
  export GOROOT="${HOME}/go"
elif [ -d "/usr/local/go" ]; then
  export GOROOT="/usr/local/go"
fi
if [ "${GOROOT}" != "" ]; then
  add_path "${GOROOT}/bin"
fi

if [ -d "${HOME}/dev" ]; then
  export GOPATH="${HOME}/dev"
  add_path "${GOPATH}/bin"
  alias gohome="pushd $GOPATH/src/github.com/masu-mi"
  alias gobit="$GOPATH/src/bitbucket.org/masu_mi"
fi
if which virtualenvwrapper.sh >& /dev/null; then
  export WORKON_HOME=${HOME}/.virtualenvs
  export PIP_RESPECT_VIRTUALENV=true
  source $(which virtualenvwrapper.sh)
fi
add_path "${HOME}/.nodebrew/current/bin"
add_path "${HOME}/.phpenv/bin"
if which phpenv >& /dev/null; then eval "$(phpenv init -)"; fi
add_path "${HOME}/.rbenv/bin"
if which rbenv >& /dev/null; then eval "$(rbenv init -)"; fi
add_path "${HOME}/pear/bin"
add_path "${HOME}/.plenv/bin"
if which plenv >& /dev/null; then eval "$(plenv init -)"; fi
add_path "${HOME}/.cabal/bin"

### cloud services
add_path "${HOME}/local/go_appengine"
add_path "/usr/local/heroku/bin"

# for different option
. ~/dotfiles/.bashrc.$(uname)

for file in $(test -d ~/.bashrcs && find ~/.bashrcs -type f);
do
  . ${file}
done

export LIBRARY_PATH="${LIBRARY_PATH}:/usr/local/lib"
# export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/lib/pkgconfig"
export CLASSPATH=".:/usr/java/default/lib/:/usr/share/java/junit.jar"

# TODO delete sentence below
export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/usr/local/include"
export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/usr/local/include/ImageMagick"
export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/usr/local/include/mysql"
export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/usr/local/include/freetype"

[ -f /etc/profile ] && . /etc/profile
[ -f /etc/bashrc ]  && . /etc/bashrc
[ -f "$HOME/.bashrc.bak" ] && . "$HOME/.bashrc.bak"

[ -f ~/dotfiles/.bashrc_aliases ] && . ~/dotfiles/.bashrc_aliases
[ -f ~/dotfiles/.bashrc_bootfuncs ] && . ~/dotfiles/.bashrc_bootfuncs
[ -f ~/.config/bashrc_local ] && . ~/.config/bashrc_local
[ -f "$HOME/local/config/bashrc" ] && . "$HOME/local/config/bashrc"

export LANG='ja_JP.UTF-8'
LC_ALL='ja_JP.UTF-8'
[[ "$(locale -a 2> /dev/null | grep ${LC_ALL} | wc -l | awk '{print $1}')" == 1 ]] && export LC_ALL || export LC_ALL='C'

export HISTSIZE=20000
export XDG_CONFIG_HOME=$HOME/.config

## setup bash_prompt
. $HOME/dotfiles/.bashrc_prompt

## basic tools
export EDITOR=nvim
export SVN_EDITOR=nvim
export RSYNC_RSH=ssh
export LESSCHARSET=utf-8
if [ -x less ]; then
  export PAGER='less -R'
fi

## add paths
add_path "/sbin"
add_path "/usr/local/opt/llvm/bin"
add_path "/opt/X11/bin"
add_path "/usr/local/sbin"
add_path "/usr/local/bin"
add_path "/usr/share/colorgcc"
add_path "${HOME}/.cargo/bin"
add_path "${HOME}/.deno/bin"
### local
add_path "${HOME}/bin"
add_path "${HOME}/local/bin"
add_path "${HOME}/.local/bin"
add_path "${HOME}/dotfiles/bin"
add_path "${HOME}/local/nvim/bin"
add_path "${HOME}/local/protoc/bin"

### specific langages
if [ -d "/usr/local/go" ]; then
  export GOROOT="/usr/local/go"
elif [ -d "${HOME}/go" ]; then
  export GOROOT="${HOME}/go"
fi
if [ "${GOROOT}" != "" ]; then
  add_path "${GOROOT}/bin"
fi

if [ -d "${HOME}/dev" ]; then
  export GOPATH="${HOME}/dev"
elif [ -d "${HOME}/go" -a "$GOROOT" != "${HOME}/go" ]; then
  export GOPATH="${HOME}/go"
fi
if [ "${GOPATH}" != "" ]; then
  add_path "${GOPATH}/bin"
  alias gohome="pushd $GOPATH/src/github.com/masu-mi"
  alias gobit="$GOPATH/src/bitbucket.org/masu_mi"
fi

add_path "${HOME}/.pyenv/bin"
add_path "${HOME}/.poetry/bin"

if which virtualenvwrapper.sh >& /dev/null; then
  export WORKON_HOME=${HOME}/.virtualenvs
  export PIP_RESPECT_VIRTUALENV=true
  export VIRTUALENVWRAPPER_PYTHON=$(command \which python3 || command \which python)
  source $(which virtualenvwrapper.sh)
fi

add_path "${HOME}/.phpenv/bin"
if which phpenv >& /dev/null; then eval "$(phpenv init -)"; fi
add_path "${HOME}/.rbenv/bin"
if which rbenv >& /dev/null; then eval "$(rbenv init -)"; fi
add_path "${HOME}/pear/bin"
add_path "${HOME}/.plenv/bin"
if which plenv >& /dev/null; then eval "$(plenv init -)"; fi
add_path "${HOME}/.cabal/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
add_path ${HOME}/.nodebrew/current/bin


zig_path=$(find ~/local/ -name 'zig-*' | head)
if [ -f "${zig_path}/zig" ]; then add_path $zig_path; fi

# for asdf
if [ -f $HOME/.asdf/asdf.sh ]; then . $HOME/.asdf/asdf.sh; fi
if [ -f $HOME/.asdf/completions/asdf.bash ]; then . $HOME/.asdf/completions/asdf.bash; fi
add_path "${HOME}/.asdf/bin/"

if [ ! $(which asdf >& /dev/null) -a $(which direnv >& /dev/null) ]; then
  eval "$(direnv hook bash)";
fi
eval "$(direnv hook bash)";

. $HOME/dotfiles/.fzf.bash

export LIBRARY_PATH="${LIBRARY_PATH}:/usr/local/lib"
# export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/lib/pkgconfig"

if which jenv > /dev/null; then eval "$(jenv init -)"; fi
export CLASSPATH=".:/usr/java/default/lib/:/usr/share/java/junit.jar"

## TODO dynamical `openjdk-9-jdk`
if [ -d '/Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home/' ]; then export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home/; fi
if [ -d '/usr/lib/jvm/java-8-openjdk-amd64' ]; then export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64; fi

add_path "${JAVA_HOME}/bin"
## TODO dynamical
add_path ${HOME}/.apache-maven-3.5.2/bin

add_path "$HOME/.embulk/bin" after
add_path "/usr/local/opt/postgresql@10/bin" after

# TODO delete sentence below
export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/usr/local/include"
export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/usr/local/include/ImageMagick"
export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/usr/local/include/mysql"
export CPLUS_INCLUDE_PATH="${CPLUS_INCLUDE_PATH}:/usr/local/include/freetype"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ];then
  . "$HOME/google-cloud-sdk/path.bash.inc"
fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ];then
  . "$HOME/google-cloud-sdk/completion.bash.inc"
fi

### cloud services
add_path "${HOME}/local/go_appengine"
add_path "/usr/local/heroku/bin"

# for different option
. ~/dotfiles/.bashrc.$(uname)


complete -C /usr/local/bin/mc mc

export WASMTIME_HOME="$HOME/.wasmtime"
add_path "$WASMTIME_HOME/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && export SDKMAN_DIR="${HOME}/.sdkman" && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

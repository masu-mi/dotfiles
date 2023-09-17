add_path ${HOME}/.local/share/rtx/bin
# add_path "${HOME}/.asdf/bin/"

## Go
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

## Python
add_path "${HOME}/.pyenv/bin"
add_path "${HOME}/.poetry/bin"

if which virtualenvwrapper.sh >& /dev/null; then
  export WORKON_HOME=${HOME}/.virtualenvs
  export PIP_RESPECT_VIRTUALENV=true
  export VIRTUALENVWRAPPER_PYTHON=$(command \which python3 || command \which python)
  source $(which virtualenvwrapper.sh)
fi

## Rust
add_path "${HOME}/.cabal/bin"
add_path "${HOME}/.cargo/bin"

## JS/TS
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
add_path ${HOME}/.nodebrew/current/bin
add_path "${HOME}/.deno/bin"

## Zig
zig_path=$(find ~/local/ -name 'zig-*' | head)
if [ -f "${zig_path}/zig" ]; then add_path $zig_path; fi

## JVM
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && export SDKMAN_DIR="${HOME}/.sdkman" && source "${SDKMAN_DIR}/bin/sdkman-init.sh"


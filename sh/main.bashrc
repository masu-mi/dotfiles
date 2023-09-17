

export LANG='C.UTF-8'
LC_ALL='C.UTF-8'
[[ "$(locale -a 2> /dev/null | grep ${LC_ALL} | wc -l | awk '{print $1}')" == 1 ]] && export LC_ALL || export LC_ALL='C'

export HISTSIZE=20000
export XDG_CONFIG_HOME=$HOME/.config

load_optional ${SH_DIR}/aliases.bashrc

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

add_path "${HOME}/bin"
add_path "${HOME}/dotfiles/bin"
add_path "${HOME}/local/nvim/bin"
add_path "${HOME}/local/protoc/bin"


. ${SH_DIR}/lang.bashrc
load_optional ${SH_DIR}/$(uname).bashrc

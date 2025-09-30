## basic tools
if [ -x "$(which nvim)" ]; then
  export EDITOR=nvim
  export SVN_EDITOR=nvim
elif [ -x "$(which vim)" ]; then
  export EDITOR=vim
  export SVN_EDITOR=vim
fi

if [ -x "$(which less)" ]; then
  export PAGER='less -R'
fi

export RSYNC_RSH=ssh
export LESSCHARSET=utf-8

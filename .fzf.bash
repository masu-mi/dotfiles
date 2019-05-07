# Setup fzf
# ---------

fzf_top=/usr/local/opt/fzf
if [ -d "${HOME}/.fzf" ]; then
  export PATH="$PATH:${HOME}/.fzf/bin"
  fzf_top=${HOME}/.fzf
fi

if [ -d "${fzf_top}" ]; then
  # Auto-completion
  # ---------------
  [[ $- == *i* ]] && . "${fzf_top}/shell/completion.bash" 2> /dev/null

  # Key bindings
  # ------------
  . "${fzf_top}/shell/key-bindings.bash"
fi

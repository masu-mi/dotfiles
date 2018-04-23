# Setup fzf
# ---------
if [[ ! "$PATH" == *${HOME}/.fzf/bin* ]]; then
  export PATH="$PATH:${HOME}/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && . "${HOME}/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
. "${HOME}/.fzf/shell/key-bindings.bash"


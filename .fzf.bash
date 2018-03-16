# Setup fzf
# ---------
if [[ ! "$PATH" == */home/masumi/.fzf/bin* ]]; then
  export PATH="$PATH:/home/masumi/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/masumi/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/masumi/.fzf/shell/key-bindings.bash"


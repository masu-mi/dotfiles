add_path "${HOME}/local/bin"
add_path "${HOME}/.local/bin"
[ -f $HOME/.config/bashrc_local ] && . $HOME/.config/bashrc_local
[ -f $HOME/local/config/bashrc ] && . $HOME/local/config/bashrc

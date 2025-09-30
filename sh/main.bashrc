
export LANG='C.UTF-8'

export HISTSIZE=20000
export XDG_CONFIG_HOME=$HOME/.config

load_optional ${SH_DIR}/aliases.bashrc

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
add_path "${HOME}/.local/bin"
add_path /opt/homebrew/opt/pcsc-lite/bin
add_path /opt/homebrew/opt/pcsc-lite/sbin


. ${SH_DIR}/lang.bashrc
load_optional ${SH_DIR}/$(uname).bashrc

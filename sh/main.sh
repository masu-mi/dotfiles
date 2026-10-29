
export LANG='C.UTF-8'

export HISTSIZE=20000
export XDG_CONFIG_HOME=$HOME/.config

load_optional ${SH_DIR}/aliases.sh

. ${SH_DIR}/lang.sh
load_optional ${SH_DIR}/$(uname).sh

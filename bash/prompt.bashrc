[ -f ${BASHRC_DIR}/color.bashrc ] && . ${BASHRC_DIR}/color.bashrc

export CH_COLOR_RED="\[${COLOR_RED}\]"
export CH_COLOR_GREEN="\[${COLOR_GREEN}\]"
export CH_COLOR_YELLOW="\[${COLOR_YELLOW}\]"
export CH_COLOR_BLUE="\[${COLOR_BLUE}\]"
export CH_COLOR_CYAN="\[${COLOR_CYAN}\]"
export CH_COLOR_MAGENTA="\[${COLOR_MAGENTA}\]"
export CH_COLOR_WHITE="\[${COLOR_WHITE}\]"

export CH_COLOR_HEIGHLIGHT_RED="\[${COLOR_HEIGHLIGHT_RED}\]"
export CH_COLOR_HEIGHLIGHT_GREEN="\[${COLOR_HEIGHLIGHT_GREEN}\]"
export CH_COLOR_HEIGHLIGHT_YELLOW="\[${COLOR_HEIGHLIGHT_YELLOW}\]"
export CH_COLOR_HEIGHLIGHT_BLUE="\[${COLOR_HEIGHLIGHT_BLUE}\]"
export CH_COLOR_HEIGHLIGHT_CYAN="\[${COLOR_HEIGHLIGHT_CYAN}\]"
export CH_COLOR_HEIGHLIGHT_MAGENTA="\[${COLOR_HEIGHLIGHT_MAGENTA}\]"
export CH_COLOR_HEIGHLIGHT_WHITE="\[${COLOR_HEIGHLIGHT_WHITE}\]"
export CH_COLOR_DEFAULT="\[${COLOR_DEFAULT}\]"

PS_USER="${CH_COLOR_YELLOW}\u${CH_COLOR_DEFAULT}"
PS_HOST="${CH_COLOR_GREEN}\h${CH_COLOR_DEFAULT}"
PS_WORK="${CH_COLOR_HEIGHLIGHT_WHITE}\W${CH_COLOR_DEFAULT}"
PS_SCREEN=""
PS_TMUX=""
PS_SSH=""

if [ -n "${WINDOW}" ] ; then
    PS_SCREEN="(${CH_COLOR_CYAN}${WINDOW}${CH_COLOR_DEFAULT})"
fi
if [ -n "${TMUX_PANE}" ] ; then
    PS_TMUX="(${CH_COLOR_CYAN}${TMUX_PANE}${CH_COLOR_DEFAULT})"
fi
if [ -n "${SSH_CLIENT}" ] ; then
    PS_SSH="(${CH_COLOR_MAGENTA}`echo ${SSH_CLIENT} | sed 's/ [0-9]\+ [0-9]\+$//g'`${CH_COLOR_DEFAULT})"
fi

function set_default_promt() {
    export PS1="[${PS_USER}${PS_SCREEN}${PS_TMUX}@${PS_HOST}${PS_SSH} $PS_WORK]\$ "
}
function set_capture_promt() {
    export PS1="🌈${CH_COLOR_YELLOW} \W ${CH_COLOR_DEFAULT} "
}

set_default_promt
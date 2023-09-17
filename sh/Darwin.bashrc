function ls_appcli () {
  base=${1:-/usr/local/bin/}
  ls -la  ${base} | \
    grep Applications | \
    awk '{printf "%32s -> %s\n",$9,$11}'
}
alias vim=nvim
alias openc='open $(pwd)'
alias opc='open $(pwd)'

alias tomorrow='date -v+1d'
alias yesterday='date -v-1d'

# w flag is for Garbled characters.
alias ls='ls -w'
alias ll='ls -lw'
alias la='ls -aw'
alias lla='ls -law'

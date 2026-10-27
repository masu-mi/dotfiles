## reuse ssh-agent via a fixed socket path
_ssh_agent_alive() {
  ssh-add -l >/dev/null 2>&1
  [ $? -ne 2 ]
}

if ! _ssh_agent_alive; then
  export SSH_AUTH_SOCK="$HOME/.ssh/agent.sock"
  if ! _ssh_agent_alive; then
    rm -f "$SSH_AUTH_SOCK"
    eval "$(ssh-agent -s -a "$SSH_AUTH_SOCK")" >/dev/null
  fi
fi

## add only keys not yet loaded, so passphrases are asked only when needed
_ssh_add_missing_keys() {
  local loaded key fp
  local -a keys opts
  if [ "$(uname)" = Darwin ]; then
    # keys whose passphrases are saved in the keychain load without a prompt
    ssh-add -q --apple-load-keychain >/dev/null 2>&1
    opts=(--apple-use-keychain)
  fi
  loaded=$(ssh-add -l 2>/dev/null | awk '{print $2}')
  while IFS= read -r key; do
    head -1 "$key" 2>/dev/null | grep -q 'PRIVATE KEY' || continue
    # fingerprint from .pub avoids a passphrase prompt
    if [ -f "$key.pub" ]; then
      fp=$(ssh-keygen -lf "$key.pub" 2>/dev/null | awk '{print $2}')
    else
      fp=$(ssh-keygen -lf "$key" </dev/null 2>/dev/null | awk '{print $2}')
    fi
    case "$loaded" in *"$fp"*) [ -n "$fp" ] && continue ;; esac
    keys+=("$key")
  done < <(find "$HOME/.ssh" -type f)
  # one ssh-add call reuses the last passphrase for following keys
  if [ ${#keys[@]} -gt 0 ]; then
    ssh-add "${opts[@]}" "${keys[@]}"
  fi
}

case $- in
  *i*) if [ -t 0 ]; then _ssh_add_missing_keys; fi ;;
esac

#!/usr/bin/env bash
# Create the ssh key used for git commit signing (see git/identity/priv.gitconfig)
# and print its public key for registering as a GitHub "Signing key".
set -eu

key="${HOME}/.ssh/git_signing.ed25519"
comment="${1:-masumi.net@gmail.com}"

if [ ! -f "$key" ]; then
  ssh-keygen -t ed25519 -f "$key" -C "$comment"
fi
cat "${key}.pub"

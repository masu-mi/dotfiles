#!/usr/bin/env bash

if ! command -v git >/dev/null; then
  # stdin is the script itself under `curl | bash`; never let apt read it or prompt
  export DEBIAN_FRONTEND=noninteractive
  sudo -E apt-get update </dev/null
  sudo -E apt-get install -y git </dev/null
fi
cd
git clone git@github.com:masu-mi/dotfiles.git
cd dotfiles
./scripts/setup.sh
cd

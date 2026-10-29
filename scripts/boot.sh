#!/usr/bin/env bash

if ! command -v git >/dev/null; then
  sudo apt update
  sudo apt install git
fi
cd
git clone git@github.com:masu-mi/dotfiles.git
cd dotfiles
./scripts/setup.sh
cd

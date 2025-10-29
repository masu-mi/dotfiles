#!/usr/bin/env bash

sudo apt install git
cd
git clone git@github.com:masu-mi/dotfiles.git
cd dotfiles
./scripts/setup.sh
cd

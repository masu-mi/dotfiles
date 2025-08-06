#!/usr/bin/env bash

top=$(dirname $0)/..
cd $top
echo "[INFO] Start init script, pwd: $(pwd)"

sudo apt install make
git submodule update --init --recursive

curl https://mise.run | sh
echo "eval \"\$(/home/masumikanai.linux/.local/bin/mise activate bash)\"" >> ~/.bashrc
. ~/.bashrc

if [ -f "$HOME/.bashrc" -a ! -L "$HOME/.bashrc" ]; then
  echo mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
  mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
fi

mise exec --env boot -- make init
mise install

$top/scripts/install-gotools.sh

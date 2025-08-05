#!/usr/bin/env bash

top=$(dirname $0)/..
cd $top
echo "[INFO] Start init script, pwd: $(pwd)"

git submodule update --init --recursive

curl https://mise.run | sh
echo "eval \"\$(/home/masumikanai.linux/.local/bin/mise activate bash)\"" >> ~/.bashrc
. ~/.bashrc

mise exec --env boot -- make init

if [ -f "$HOME/.bashrc" -a ! -L "$HOME/.bashrc" ]; then
  echo mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
  mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
fi

make

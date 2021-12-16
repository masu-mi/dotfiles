#!/usr/bin/env bash

top=$(dirname $0)/..
cd $top
echo "[INFO] Start init script, pwd: $(pwd)"

git submodule update --init --recursive

if [ -f "$HOME/.bashrc" -a ! -L "$HOME/.bashrc" ]; then
  echo mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
  mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
fi

make

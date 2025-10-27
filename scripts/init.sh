#!/usr/bin/env bash

top=$(dirname $0)/..
cd $top
echo "[INFO] Start init script, pwd: $(pwd)"
. ./scripts/lib.sh

git submodule update --init --recursive

install_apt_package_set init
curl https://mise.run | sh
echo "eval \"\$(${HOME}/.local/bin/mise activate bash)\"" >> ~/.bashrc

reload_rc
if [ -f "$HOME/.bashrc" -a ! -L "$HOME/.bashrc" ]; then
  echo mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
  mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
fi

reload_rc
echo [INFO] mise exec --env boot -- make init
mise exec --env boot -- make init

reload_rc
echo [INFO] mise install
mise install

reload_rc
$top/scripts/install-gotools.sh

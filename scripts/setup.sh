#!/usr/bin/env bash

top=$(dirname $0)/..
cd $top
echo "[INFO] Start init script, pwd: $(pwd)"
. ./scripts/lib.sh

git submodule update --init --recursive

install_apt_package_set init

MISE_DIR=${HOME}/.local/bin

curl https://mise.run | sh
echo "eval \"\$(${MISE_DIR}/mise activate bash)\"" >> ${HOME}/.bashrc

. ${HOME}/.bashrc
if [ -f "$HOME/.bashrc" -a ! -L "$HOME/.bashrc" ]; then
  echo mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
  mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
fi

echo [INFO] mise exec --env boot -- make init
${MISE_DIR}/mise exec --env boot -- make init

. ~/.bashrc
echo [INFO] mise install
mise install

. ~/.bashrc
$top/scripts/install-gotools.sh
$top/scripts/install-npmtools.sh

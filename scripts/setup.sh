#!/usr/bin/env bash

set -eu

top=$(cd "$(dirname "$0")/.." && pwd)
cd "$top"
echo "[INFO] Start init script, pwd: $(pwd)"
. ./scripts/lib.sh

git submodule update --init --recursive

install_package_set init

# ~/.bashrc does not take effect in this non-interactive shell, so set PATH here
export PATH="${HOME}/.local/bin:${HOME}/.local/share/mise/shims:${PATH}"
command -v mise >/dev/null || curl https://mise.run | sh
mise trust "$top/mise.toml" "$top/mise.boot.toml"

# make init needs only python (pip); keep mise from installing every tool in mise.toml first
echo [INFO] make init
MISE_OVERRIDE_CONFIG_FILENAMES=mise.boot.toml MISE_GLOBAL_CONFIG_FILE="$top/mise.boot.toml" \
  mise exec -- make init

echo [INFO] mise install
mise install

./scripts/install-gotools.sh
./scripts/install-npmtools.sh

curl -sSL https://aka.ms/apm-unix | sh

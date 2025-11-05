#!/usr/bin/env bash

top=$(dirname $0)/..
pkg_mgr_cmd=${1:-uv} # poetry

pushd $top
  echo "[INFO] Start init script, pwd: $(pwd)"
  . ./scripts/lib.sh

  install_apt_package_set libvirt-dev
popd

${pkg_mgr_cmd} add libvirt-python

#!/usr/bin/env bash

set -eu

path=$1

unzip -p $path "$(jar tf $path | fzf)"

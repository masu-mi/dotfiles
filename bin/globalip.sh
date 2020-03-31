#!/usr/bin/env sh

set -e

cmd='curl httpbin.org/ip'

if [ "$1" = "--json" ]; then
  $cmd
else
  $cmd 2>/dev/null | jq -r '.origin'
fi

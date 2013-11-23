#!/usr/bin/env bash


if [ `uname` != Darwin ] ; then
  exit
fi
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

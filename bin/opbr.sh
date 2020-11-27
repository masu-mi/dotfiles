#!/usr/bin/env sh

browser=$2
if [ "$browser" = "" ]; then
  browser=$BROWSER
fi
if [ "$browser" = "" ]; then
  browser='Vivaldi'
fi

open "$1" -a $browser

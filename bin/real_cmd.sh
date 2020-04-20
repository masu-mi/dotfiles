#!/usr/bin/env bash

cmd=$(which $1)

cd $(dirname $cmd)
target=$(basename $cmd)
link=$(readlink $target)
while [ "$link" != "" ]
do
  cd $(dirname $link)
  target=$(basename $link)
  link=$(readlink $target)
done

echo $(pwd)/$target

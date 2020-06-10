#!/usr/bin/env bash

function confirmation_cont() {
  echo "$1 [y/N]" >&2
  read answer
  case $answer in
    [yY])
      ;;
    *)
      continue
      ;;
  esac
}

for ver in 3 3.6 3.7 3.8 ; do
  for target in python idle ; do
    cmd="$target$ver"
    pip="pip$ver"

    echo [INFO] version: $ver, target: $target
    echo [INFO][NOW]: $(which $pip) "->" $(real_cmd.sh $pip)
    echo [INFO][NOW]: $(which $cmd) "->" $(real_cmd.sh $cmd)

    next_dir=$(dirname $(real_cmd.sh $pip))
    target_link=$(which $cmd)
    if [ -e "$next_dir/$cmd" -a "$(real_cmd.sh $cmd)" != "$next_dir/$cmd" ]; then
      echo "rm $target_link && ln -s $next_dir/$cmd $target_link"
      confirmation_cont "Execute this?"
      rm $target_link && ln -s $next_dir/$cmd $target_link
      echo ""
    fi
  done
done
echo "[INFO] ALL DONE"

#!/usr/bin/env bash

image=$1
shift
if [ "$image" == "go" ]; then
  image=${default_go:-"golang"}
fi
docker run -it -v $(pwd):/tmp/ ${image} go $@

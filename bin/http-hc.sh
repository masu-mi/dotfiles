#!/usr/bin/env bash

target_url=$1

if [ "$DATE_CMD" = "" ]; then
  DATE_CMD='date -u'
fi

interval_sec=0.3
if [ "$2" != "" ]; then
  interval_sec=$2
fi

echo "# $DATE_CMD(interval_sec = \"$interval_sec\"), HTTP Status(url= \"$target_url\")"
while true; do
  echo "$($DATE_CMD),$(curl -v $target_url 2>&1 > /dev/null \
    | grep -E '<\s+HTTP/(1.1|2)\s+[23]0' \
    | wc -l)"
  sleep $interval_sec
done

#!/usr/bin/env bash

git add .
git commit -m "'Add directory \"$(basename $(cd ..; pwd))/$(basename $(pwd))\" with addir.sh'"

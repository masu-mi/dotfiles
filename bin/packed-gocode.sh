#!/usr/bin/env bash

goone pack $1 \
  --package main \
  --template=fullcode.go \
  | pbcopy

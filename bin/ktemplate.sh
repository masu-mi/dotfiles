#!/usr/bin/env bash

kubectl run --dry-run -o yaml \
 $@ 2>/dev/null

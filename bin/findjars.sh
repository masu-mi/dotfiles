#!/usr/bin/env bash

target=$(cd $1; pwd)

find $target -name '*.jar'

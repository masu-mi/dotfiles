#!/usr/bin/env bash

localdir=${HOME}/local
# http://www.ff.iij4u.or.jp/~nrt/lv/#install
wget http://www.ff.iij4u.or.jp/~nrt/freeware/lv451.tar.gz
tar xvzf lv451.tar.gz
cd `ls -1 -d lv* |grep -v tar`
./src/configure --prefin=$localdir && make && make install

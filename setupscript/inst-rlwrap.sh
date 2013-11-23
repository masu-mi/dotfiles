#!/usr/bin/env bash


localdir=${HOME}/local

# http://utopia.knoware.nl/~hlub/rlwrap/#rlwrap
wget http://utopia.knoware.nl/~hlub/rlwrap/rlwrap-0.37.tar.gz
tar xvzf rlwrap-0.37.tar.gz
cd `ls -1 -d rlwrap* |grep -v tar`
info-state
./configure --prefix=$localdir && make && make install

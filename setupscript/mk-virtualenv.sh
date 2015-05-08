#!/usr/bin/env bash

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
source $(which virtualenvwrapper.sh)
export WORKON_HOME=${HOME}/.virtualenvs
export PIP_RESPECT_VIRTUALENV=true

mkvirtualenv py3 -p /usr/local/bin/python3
mkvirtualenv pypy -p /usr/local/bin/pypy

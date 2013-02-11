#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import os

_dotfiles = ['.vimrc',
             '.bashrc',
             '.bash_profile',
             '.bash_aliases',
             '.gitconfig',
             '.tmux.conf',
             '.screenrc']

def get():
  return _dotfiles

def set(filename):
  _dotfiles.append(filename)

def remove(filename):
  _dotfiles.remove(filename)

def init(filenames = []):
  _dotfiles = filenames

def deploy():
  def set_conf_file(filename):
    os.symlink(os.path.join(os.environ['HOME'], dotfile),
               os.path.join(os.path.abspath(os.path.dirname(__file__)), dotfile))
  for dotfile in _dotfiles:
    set_base_conf_file(dotfile)

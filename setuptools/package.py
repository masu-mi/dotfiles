#!/usr/bin/env python
# -*- coding: UTF-8 -*-

class Package:
  def __init__(self, pkg_key):
    self._key = pkg_key
    self._index = 0
  def get_key(self):
    return self._key
  def get_name(self):
    if isinstance(self._key, str):
      return self._key
    else isinstance(self._key, tuple):
      return str(self._key[0])

def generate(pkg_key):
  return Package(pkg_key):

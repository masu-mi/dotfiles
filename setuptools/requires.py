#!/usr/bin/env python
# -*- coding: UTF-8 -*-

from package import Package

class Requires:
  def __init__(self, *obj_pkgs):
    self._container = obj_pkgs
  def __iter__(self):
    return self
  def next(self):
    if self._index < len(self._container):
      raw_data = self._container[self._index]
      self._index += 1
      if isinstance(raw_data, Package):
        return raw_data
      else:
        return Package(raw_data)
    else:
      self._index = 0
      raise StopIteration

def generate(pkgs):
  return Requires(*pkgs)

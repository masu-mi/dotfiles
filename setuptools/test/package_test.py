#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import sys, os
sys.path.append(
    os.path.join(
      os.path.abspath(os.path.dirname(__file__)), '..'))

import package
from package import Package

keys = [
    'name',
    '0123',
    'Fight_get',
    ('fight', 'get', 'key_3'),
    ('get', 'test')
  ]
names = [
    'name',
    '0123',
    'Fight_get',
    'fight',
    'get'
  ]

class TestPackage:


  def test_get_key(self):
    for key in keys:
      pkg = Package(key)
      assert key == pkg.get_key()

  def test_get_name(self):
    for idx, name in enumerate(names):
      pkg = Package(keys[idx])
      assert name == pkg.get_name()

def test_generate_get_key():
  for key in keys:
    pkg = package.generate(key)
    assert key == pkg.get_key()

def test_generate_get_name():
    for idx, name in enumerate(names):
      pkg = package.generate(keys[idx])
      assert name == pkg.get_name()

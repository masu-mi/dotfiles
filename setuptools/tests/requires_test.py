#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import sys, os
sys.path.append(
    os.path.join(
      os.path.abspath(os.path.dirname(__file__)), '..'))

import requires
from requires import Requires

_requiresz = [
    ["key1", ("key2_1", "key2_2"), "key_3"],
    ["key1", "key2", "key3"],
    [ ("key1_1", "key1_2", "key1_3"),
      ("key2_1", "key2_2"),
      ("key3_1", "key3_2", "key3_3"), ]
    ]

class TestRequires:

  def test_iter_eq_key(self):
    for _requires in _requiresz:
      reqz = Requires(*_requires)

      index = 0
      for target_req in reqz:
        assert _requires[index] == target_req.get_key()
        index += 1

  def test_iter_eq_name(self):
    for _requires in _requiresz:
      reqz = Requires(*_requires)

      index = 0
      for target_req in reqz:
        assert (_requires[index] if isinstance(_requires[index], str)
                                 else _requires[index][0]) == target_req.get_name()
        index += 1

def test_iter_eq_key():
  for _requires in _requiresz:
    reqz = requires.generate(_requires)

    index = 0
    for target_req in reqz:
      assert _requires[index] == target_req.get_key()
      index += 1

def test_iter_eq_name():
  for _requires in _requiresz:
    reqz = requires.generate(_requires)

    index = 0
    for target_req in reqz:
      assert (_requires[index] if isinstance(_requires[index], str)
                               else _requires[index][0]) == target_req.get_name()
      index += 1

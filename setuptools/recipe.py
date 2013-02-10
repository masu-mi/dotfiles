#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import shlex, subprocess

_managers = {}

class Recipe:
  def __init__(self, package, command, requires):
    self._pkg = package
    self._cmd = command
    self._rqs = requires

  def get_package(self):
    return self._pkg

  def get_key(self):
    return self._pkg.get_key()

  def get_name(self):
    return self._pkg.get_name()

  def get_requires(self):
    return self._rqs

  def get_command(self):
    return self._cmd


## コマンドラインを文字列から作るよー
def gen_command(command_line):
  def _command(obj_pkg):
    print subprocess.Popen(shlex.split(command_line))
  return _command

def _gen_manager_command(command_line):
  def _command(obj_pkg):
    print subprocess.Popen(
        shlex.split(command_line).append(object_pkg.get_name()))
  return _command

def generate_with_manager(pkg_name, manager):
  requires, command = _managers[manager]
  return generate(pkg_name,
                  requires,
                  lambda : command(pkg_name))

def generate(pkg_name, requires, command):
  return Recipe( package.generate(pkg_name),
                 requires.generate(requires),
                 command)



def add_manager(name, requires, command_line):
  _manager[name] = (requires, _gen_manager_command(command_line))

def init_managers():
  _manager = {}

def _get_from_managers(name):
  return _manager[name]

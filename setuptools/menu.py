#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import recipe

_menu   = {}
installed_list = []


## 基本のpkgをインストールする
def install():
  for recipe in _menu:
    proceed(recipe)

# インストールする候補に追加する
def add(recipe):
  installed_list[recipe.get_key] = recipe



# 各段階の実行
def proceed(recipe):

  # 既にインストールされてたら何もしない
  if recipe.get_key in installed_list:
    return

  # 事前にインストール必要が有るpkgをインストール
  requires = recipe.get_requires()
  for require in requires:
    recipe_ = get_recipe(require.get_key())
    if (recipe_ != False):
      proceed(recipe_)

  # 本体をインストール
  recipe.get_command()()
  installed_list.append(recipe.get_key)

# レシピの取得
def get_recipe(key_name):
  if _menu.has_key(key_name):
    return _menu[key_name]
  elif _is_installed(key_name):
    return False;
  raise RuntimeError()

def is_installed(package):
  import commands
  if commands.getoutput('which ',package.get_name) != '':
    return True
  else:
    return False

def init(input_menu):
  _menu = input_menu

def update(input_menu):
  for recipe in input_menu:
    add(recipe)

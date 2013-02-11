#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import platform
import configfiles
import recipe, menu



system_name = platform.system()

def set_manager(
    key,
    requires,
    command_line,
    install_command):
  recipe.add_manager(key, requires, command_line)
  menu.add(recipe.generate(key, requires, install_command)



if __name__ == '__main__':
  # conf fileのリンク作成
  # aliaseの作成
  if system_name = 'Darwin':
    set_manager(
      'main',
      ('wget', 'perl'),
      'brew install ',
      'wget https://raw.github.com/hokaccha/nodebrew/master/nodebrew; perl nodebrew setup')
  # menu
  # install
  pass

manager_pkg = {
      'SOUCE':{['nodebrew':], }
      'MAIN' :[git, vim, lv, ],
      'npm'  :[]
      'pip'  :['virtualenv', 'virtualenv-wrapper', 'tox'],
    }

## pkgをインストールしたり
## 必ず入れるツール
require_commands = ('git', 'lv', 'tmux', 'vim') #zsh

## 環境種別の取得
#### os, distribution, private/office, develop/production/test/qa/staging


## pkg manager
#### homebrew, nodebrew, pip/easy_install, cabal, rpn


## vim plugins
#### bundle導入
#### molokai導入

## 仮想環境を作成したり
## フォントを作成したり

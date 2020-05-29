#!/usr/bin/env bash

src_dir=~/dev/src/github.com/masu-mi/gamemo/lib/gocom/
snip_dir=~/dotfiles/vim/template/go
prefix=snip-compe-lib-

ls $snip_dir/ | grep $prefix | xargs -I{} rm $snip_dir/{}
goone gen $src_dir -o $snip_dir -p $prefix

"#### 文字コード自動判別
set encoding=utf-8
scriptencoding utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932
set fileformats=unix,dos,mac

"# Plugin導入
source ~/dotfiles/vim/bundles.vim

"# 基本設定
source ~/dotfiles/vim/base.vim

"# サポート
source ~/dotfiles/vim/support.vim

"# 入力時挙動
source ~/dotfiles/vim/insert.vim

"# 表示
source ~/dotfiles/vim/display.vim

scriptencoding utf-8

"### キーマップ
imap ( ()<LEFT>
imap [ []<LEFT>
imap { {}<LEFT>

"### バックスペース挙動
set backspace=indent,start,eol


"### insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline

"### 補完
"### フォールディング設定
set foldmethod=syntax
set foldlevel=10
source ~/dotfiles/vim/complete.vim

"### インデント
set autoindent
set cindent
set smartindent

"### タブ関連
set tabstop=2 shiftwidth=2 softtabstop=0
set expandtab

augroup filetypedetect
        au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
augroup END

augroup staticcheck
  au!
  au BufWritePost *.{py} exe ":!pep8 %; pyflakes %"
  au BufWritePost *.{php} exe ":!php -l %"
augroup END

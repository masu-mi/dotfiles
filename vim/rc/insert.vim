scriptencoding utf-8

"### キーマップ
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap <C-l> <RIGHT>

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

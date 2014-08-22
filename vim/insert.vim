"### キーマップ
imap ( ()<LEFT>
imap [ []<LEFT>
imap { {}<LEFT>

"### バックスペース挙動
set backspace=indent,start,eol

"### 括弧ハイライト
set showmatch
set matchtime=3
set matchpairs+=<:>

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

"### ファイルタイプ毎
if has("autocmd")

    "Coffee設定
    autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!
endif
augroup filetypedetect
        au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
augroup END


augroup staticcheck
    au BufWritePost *.{py} exe ":!pep8 %; pyflakes %"
    au BufWritePost *.{php} exe ":!php -l %"
augroup END

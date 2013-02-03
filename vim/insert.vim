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
set tabstop=4 shiftwidth=4 softtabstop=0
set expandtab

"### ファイルタイプ毎
if has("autocmd")

" これらのftではインデントを無効に
"    autocmd FileType html :set indentexpr=
"    autocmd FileType xhtml :set indentexpr=

    "python設定
    autocmd FileType python setl autoindent
    autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType python setl tabstop=2 shiftwidth=2 softtabstop=0

    "scheme設定
    autocmd FileType scheme :map <C-e> <ESC>:!gosh %<CR>

    "php設定
    autocmd FileType php filetype indent off
    autocmd FileType php :map <C-e> <ESC>:!php %<CR>
    autocmd FileType php :map <C-n> <ESC>:!php -l %<CR>
endif
augroup filetypedetect
        au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
augroup END

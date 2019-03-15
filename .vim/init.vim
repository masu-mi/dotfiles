scriptencoding utf-8

let mapleader = "\<Space>"

" 文字コード自動判別
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932
set fileformats=unix,dos,mac

" Plugin導入
source ~/dotfiles/vim/bundles.vim


" 基本設定
set shortmess+=I
set vb t_vb=
set hidden
set laststatus=2
set lazyredraw
set ttyfast
set history=1000
" ファイルタイプ
filetype plugin on
filetype indent on

" サポート
set nrformats-=octal
source ~/dotfiles/vim/keymap.vim
" 入力時挙動
source ~/dotfiles/vim/insert.vim

" 画面表示項目
set number
set relativenumber
set nowrap
set ruler
set laststatus=2
set cmdheight=1
set showmode
set showcmd
set title

let g:netrw_liststyle=1
" folding
set foldmethod=syntax
set foldlevel=10
set ambiwidth=double
" 検索
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan
set showmatch
set matchtime=3
set matchpairs+=<:>

" let g:showmarks_include='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
" カレントウィンドウにのみ罫線を引く
augroup cursor_line
  autocmd!
  autocmd WinLeave * set nocursorline
  autocmd WinLeave * set nocursorcolumn
  autocmd WinEnter,BufRead * set cursorline
  autocmd WinEnter,BufRead * set nocursorcolumn
augroup END

augroup filetype_alias
  autocmd!
  autocmd BufRead,BufNewfile *.dig set filetype=yaml
  autocmd BufRead,BufNewfile *.avsc set filetype=json
augroup END

" 不可視文字の表示
set list
set listchars=tab:>-,trail:_,precedes:<,extends:>
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" 基本カラーリング関連
syntax on
let g:molokai_original=1
colorscheme molokai

nnoremap <F3> :<C-u>setlocal relativenumber!<CR>
nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR>
nnoremap <F6> :<C-u>source $MYVIMRC<CR> :source $MYVIMRC<CR>
nnoremap <F8> :Tagbar<CR>

nnoremap <C-b> <C-t>
set tags+=.git/tags,.svn/tags

call has('python3')

set mouse=a
set ttymouse=xterm2

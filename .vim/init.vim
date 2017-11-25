scriptencoding utf-8

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

" 不可視文字の表示
set list
set listchars=tab:>-,trail:_,precedes:<,extends:>
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" 基本カラーリング関連
syntax on
let g:molokai_original=1
colorscheme molokai

nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR>
nnoremap <F6> :<C-u>source $MYVIMRC<CR> :source $MYVIMRC<CR>

" Unite
nnoremap <silent> <Leader>uf :<C-u>DeniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> <Leader>ut :<C-u>Denite tab<CR>
nnoremap <silent> <Leader>ub :<C-u>Denite buffer_tab
nnoremap <silent> <Leader>uB :<C-u>Denite buffer

""" nnoremap <Leader>le :Unite git_modified<CR>
""" nnoremap <Leader>lu :Unite git_untracked<CR>
""" nnoremap <Leader>lc :Unite git_cached<CR>
""" nnoremap <Leader>ld :Unite gtags/def<CR>
""" nnoremap <Leader>cf :Unite filetype<CR>

""" noremap <Leader>ff :VimFiler -split -toggle -no-quit -winwidth=40 -simple<CR>
""" noremap <Leader>cap :mkview<CR>


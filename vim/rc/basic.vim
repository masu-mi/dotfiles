scriptencoding utf-8

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
set nrformats-=octal

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
set foldmethod=syntax
set foldlevel=10

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
  autocmd BufRead,BufNewfile *bashrc* set filetype=sh
augroup END

" 不可視文字の表示
set list
set listchars=tab:>-,trail:_,precedes:<,extends:>
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

nnoremap <F3> :<C-u>setlocal relativenumber!<CR>
nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR>
nnoremap <F6> :<C-u>source $MYVIMRC<CR> :source $MYVIMRC<CR>
nnoremap <F8> :Vista!!<CR>

nnoremap <C-b> <C-t>
set tags+=.git/tags,.svn/tags

set mouse=a

let g:python3_host_prog = 'python3.8'

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
" ファイルタイプ
filetype plugin on
filetype indent on

" サポート
source ~/dotfiles/vim/support.vim
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
set t_Co=256
colorscheme molokai

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR>
nnoremap <F6> :<C-u>source $MYVIMRC<CR> :source $MYVIMRC<CR>

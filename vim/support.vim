scriptencoding utf-8

let mapleader = ','

" ウィンドウ移動
nnoremap <C-j> :<C-w>j
nnoremap <C-k> :<C-w>k
nnoremap <C-l> :<C-w>l
nnoremap <C-h> :<C-w>h

"### 数値インクリメント
set nrformats-=octal

"### タグ機能
set tags=./tags,../tags,~/tags

"### mkviewコマンド
set viewdir=~/.backup/view

"### ファイラー
let g:netrw_liststyle=1

"### フォールディング設定
set foldmethod=syntax
set foldlevel=10
set ambiwidth=double

"### バックアップ設定
source ~/dotfiles/vim/backup.vim

"### 検索
set incsearch
set hlsearch
set wrapscan
"### Escの2回押しで検索ハイライト消去
noremap <ESC><ESC> :nohlsearch<CR><ESC>

noremap <Space>p :set paste<CR>
noremap <Space>n :set nopaste<CR>

"### 履歴
set history=1000           " コマンド・検索パターンの履歴数

"## 自動修正
"if has('autocmd')
"  " 保存時に行末の空白を除去する
""  autocmd BufWritePre * :%s/\s\+$//ge
"  " 保存時にtabをスペースに変換する
""  autocmd BufWritePre * :%s/\t/  /ge
"endif

" ## matchit.vim 利用
source ${VIMRUNTIME}/macros/matchit.vim

"### ヘルプ
" Ctrl-iでヘルプ
nnoremap <C-i>  :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_python_checkers=['pyflakes', 'pep8']

nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd lclose\|bdelete

"for gnu global
nnoremap <Space>gd :Gtags<Space>
nnoremap <Space>gr :Gtags -r
nnoremap <Space>gf :Gtags -f
nnoremap <Space>gg :Gtags -g
nnoremap <Space>gc :GtagsCursor<Enter>
nnoremap <Space>gu :GtagsUpdate<Enter>

"for Quickfix
nnoremap <C-j> :cn<CR>
nnoremap <C-k> :cp<CR>

" for window, buffer, tab page
nnoremap s <Nop>
nnoremap ss :sp<CR>
nnoremap sv :vs<CR>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sw <C-w>w
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sr <C-w>r

nnoremap so <C-w>_
nnoremap sO <C-w>=
nnoremap s= <C-w>=

nnoremap st :tabnew<CR>
nnoremap sn gt
nnoremap sp gT

nnoremap <F8> :Tagbar<CR>

nnoremap sT :Unite tab<CR>
nnoremap sb :Unite buffer_tab
nnoremap sB :Unite buffer
nnoremap <Space>le :Unite git_modified<CR>
nnoremap <Space>lu :Unite git_untracked<CR>
nnoremap <Space>lc :Unite git_cached<CR>
nnoremap <Space>ld :Unite gtags/def<CR>

nnoremap <Space>cf :Unite filetype<CR>

nnoremap sq :q
nnoremap sQ :bd

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')


" Quickfix 用
nnoremap [q :cprevious<CR>    " 前へ
nnoremap ]q :cnext<CR>        " 次へ
nnoremap [Q :<C-u>cfirst<CR>  " 最初へ
nnoremap ]Q :<C-u>clast<CR>   " 最後へ

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


nnoremap <Space>vs :VimShell<Enter>
nnoremap <Space>vf :VimFilerExplorer<Enter>

" for file
nnoremap <Space>of :vs<Space>
nnoremap zz :VimFiler -split -toggle -no-quit -winwidth=40 -simple<CR>

" for go
" todo
" filetype off
" filetype plugin indent off
" set rtp+=$GOROOT/misc/vim
" autocmd FileType go autocmd BufWritePre <buffer> Fmt
" filetype plugin indent on
" exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
" set completeopt=menu,preview

let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_CursorHold_enable = 1
let g:quickrun_config = {
      \   '_' : {
      \       'runner' : 'vimproc',
      \       'runner/vimproc/updatetime' : 10,
      \   },
      \   'go/watchdogs_checker' : {
      \     'type' : 'watchdogs_checker/golint',
      \   },
      \   'watchdogs_checker/go_build' : {
      \     'command' : 'go',
      \     'exec' : '%c build %s:p',
      \     'errorformat' : '%f:%l: %m,%-G%.%#',
      \   },
      \   'watchdogs_checker/golint' : {
      \     'command' :     'golint',
      \     'exec' :        '%c %o %s:p',
      \     'errorformat' : '%f:%l:%c: %m,%-G%.%#',
      \   },
      \ }
call watchdogs#setup(g:quickrun_config)
autocmd QuickFixCmdPost *grep* cwindow

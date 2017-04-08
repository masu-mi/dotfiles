scriptencoding utf-8

" バックアップ
source ~/dotfiles/vim/backup.vim
" folding
set foldmethod=syntax
set foldlevel=10
set ambiwidth=double
" 検索
set incsearch
set hlsearch
set wrapscan
" increment
set nrformats-=octal

let mapleader = ','
" Escの2回押しで検索ハイライト消去
noremap <Leader><Leader> :nohlsearch<CR><ESC>
noremap <Space>cap :mkview<CR>
noremap <Space>p :set paste<CR>
noremap <Space>n :set nopaste<CR>

" 履歴
set history=1000           " コマンド・検索パターンの履歴数

" 行末スペース削除
noremap <Space>rmsp :%s/\s\+$//ge<CR>

" 括弧ハイライト
set showmatch
set matchtime=3
set matchpairs+=<:>
" ## matchit.vim 利用
" デフォルトで含まれてるけど無効化されている
source ${VIMRUNTIME}/macros/matchit.vim

"### ヘルプ
" Ctrl-iでヘルプ
nnoremap <C-i>  :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby', 'javascript','vim'] }
let g:syntastic_python_checkers=['pyflakes', 'pep8']
let g:syntastic_ruby_checkers = ['rubocop'] " or ['rubocop', 'mri']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
hi SyntasticErrorSign ctermfg=160
hi SyntasticWarningSign ctermfg=220

"for gnu global
set tags=./tags,../tags,~/tags
nnoremap <Space>gd :Gtags<Space>
nnoremap <Space>gr :Gtags -r
nnoremap <Space>gf :Gtags -f
nnoremap <Space>gg :Gtags -g
nnoremap <Space>gc :GtagsCursor<Enter>
nnoremap <Space>gu :GtagsUpdate<Enter>
" tagbar
nnoremap <F8> :Tagbar<CR>
"for Quickfix: jump to error
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprevious<CR>
nnoremap <C-h> :clast<CR>
nnoremap <C-l> :cfirst<CR>
" filer
let g:netrw_liststyle=1 " 不要なら消す
nnoremap zz :VimFiler -split -toggle -no-quit -winwidth=40 -simple<CR>

" for window, buffer
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
" tab
nnoremap tt :tabnew<CR>
nnoremap sn gt
nnoremap sp gT
" close
nnoremap sq :q
nnoremap sQ :bd
nnoremap <C-d> :bd<CR>
" サイズ調整
nnoremap so <C-w>_
nnoremap sO <C-w>=
nnoremap s= <C-w>=
" Unite
nnoremap sT :Unite tab<CR>
nnoremap sb :Unite buffer_tab
nnoremap sB :Unite buffer
nnoremap <Space>le :Unite git_modified<CR>
nnoremap <Space>lu :Unite git_untracked<CR>
nnoremap <Space>lc :Unite git_cached<CR>
nnoremap <Space>ld :Unite gtags/def<CR>
nnoremap <Space>cf :Unite filetype<CR>
" shell
nnoremap <Space>vs :VimShell<Enter>
nnoremap <Space>vf :VimFilerExplorer<Enter>

" for go
" todo
" filetype off
" filetype plugin indent off
" set rtp+=$GOROOT/misc/vim
" autocmd FileType go autocmd BufWritePre <buffer> Fmt
" filetype plugin indent on
" exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
" set completeopt=menu,preview

" for watchdogs
" let g:watchdogs_check_BufWritePost_enable = 1
" let g:watchdogs_check_CursorHold_enable = 1
" let g:quickrun_config = {
"       \   '_' : {
"       \       'runner' : 'vimproc',
"       \       'runner/vimproc/updatetime' : 10,
"       \   },
"       \   'go/watchdogs_checker' : {
"       \     'type' : 'watchdogs_checker/golint',
"       \   },
"       \   'watchdogs_checker/go_build' : {
"       \     'command' : 'go',
"       \     'exec' : '%c build %s:p',
"       \     'errorformat' : '%f:%l: %m,%-G%.%#',
"       \   },
"       \   'watchdogs_checker/golint' : {
"       \     'command' :     'golint',
"       \     'exec' :        '%c %o %s:p',
"       \     'errorformat' : '%f:%l:%c: %m,%-G%.%#',
"       \   },
"       \ }
" autocmd QuickFixCmdPost *grep* cwindow
" カーソル下の呼び出し元一覧を出力
nnoremap <silent> ,tr  :<C-u>Unite gtags/ref:<CR>
" " カーソル下の定義元を出力
nnoremap <silent> ,td  :<C-u>Unite gtags/def:<CR>
" " タグファイル内grep
nnoremap <silent> ,tg  :<C-u>Unite gtags/grep:<CR>


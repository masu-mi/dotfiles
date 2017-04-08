scriptencoding utf-8

if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

"     " NeoBundle 'Shougo/vimshell'
"     NeoBundle 'Shougo/unite.vim'
"     " NeoBundle 'Shougo/neossh.vim'
"     NeoBundle 'hewes/unite-gtags'
"     " NeoBundle 'taka84u9/unite-git'
"     " NeoBundle 'osyo-manga/unite-filetype'
"     " NeoBundle 'Shougo/unite-outline'
"     " NeoBundle 'jceb/vim-orgmode'
"     " 
"     " NeoBundle 'dag/vim2hs'
"     " NeoBundle 'thinca/vim-quickrun'
"     " NeoBundle "osyo-manga/vim-watchdogs"
"     " call watchdogs#setup(g:quickrun_config)
"     " NeoBundle "osyo-manga/shabadou.vim"
"     " NeoBundle "jceb/vim-hier"
"     " 
"     " NeoBundle 'thinca/vim-ref'
"     " NeoBundle 'Shougo/neocomplcache'
"     " NeoBundle 'othree/html5.vim'
"     " NeoBundle 'open-browser.vim'
"     " NeoBundle 'pangloss/vim-javascript'
"     " NeoBundle 'kchmck/vim-coffee-script'
"     " NeoBundle 'tpope/vim-markdown'
"     NeoBundle 'Lokaltog/vim-powerline'
"     " NeoBundle 'eagletmt/ghcmod-vim'
"     " NeoBundle 'eagletmt/neco-ghc'
"     " " NeoBundle 'scrooloose/syntastic'
"     " NeoBundle 'kana/vim-submode'
"     " 
"     " NeoBundle 'tpope/vim-pathogen'
"     " execute pathogen#infect()
"     " 
"     " " www.vim.orgにあるplugin
"     " NeoBundle 'YankRing.vim'
"     " NeoBundle 'JavaScript-syntax'
"     " NeoBundle 'bufexplorer.zip'
"     " NeoBundle 'errormarker.vim'
"     " NeoBundle 'project.tar.gz'
"     " NeoBundle 'xml.vim'
"     " 
"     " call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
"     " call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
"     " call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
"     " call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
"     " call submode#map('bufmove', 'n', '', '>', '<C-w>>')
"     " call submode#map('bufmove', 'n', '', '<', '<C-w><')
"     " call submode#map('bufmove', 'n', '', '+', '<C-w>+')
"     " call submode#map('bufmove', 'n', '', '-', '<C-w>-')

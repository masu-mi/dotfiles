filetype off
" Vundle利用に関する初期設定
if has('vim_starting')
  set rtp+=~/.vim/neobundle.vim.git
  call neobundle#rc(expand('~/.neobundle'))
endif


"NeoBundle自体
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'

" githubにあるplugin
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'c9s/cascading.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'open-browser.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'dag/vim2hs'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kana/vim-submode'

NeoBundle 'tpope/vim-pathogen'
execute pathogen#infect()

" www.vim.orgにあるplugin
NeoBundle 'YankRing.vim'
NeoBundle 'JavaScript-syntax'
NeoBundle 'bufexplorer.zip'
NeoBundle 'errormarker.vim'
NeoBundle 'ShowMarks7'
NeoBundle 'project.tar.gz'
NeoBundle 'xml.vim'

" color scheme
NeoBundle 'tomasr/molokai'

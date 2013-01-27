"### 画面表示項目
set number
set nowrap
set ruler
set cmdheight=1
set showmode
set showcmd
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8p
set title

"### 基本カラーリング関連
syntax on
let g:molokai_original=1
colorscheme molokai

"### カーソル行ハイライト
set cursorline
"### カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinLeave * set nocursorcolumn
  autocmd WinEnter,BufRead * set cursorline
  autocmd WinEnter,BufRead * set nocursorcolumn
augroup END

"### 不可視文字の表示
set list
set listchars=tab:>-,trail:_,precedes:<,extends:>
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

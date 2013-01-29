"### シフトを押したくない事がある
"noremap ; :
"noremap : ;

" ウィンドウ移動
nnoremap <C-j> ;<C-w>j
nnoremap <C-k> ;<C-k>j
nnoremap <C-l> ;<C-l>j
nnoremap <C-h> ;<C-h>j

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
source ~/dotfiles/conf-vim/backup.vim

"### 検索
set incsearch
set hlsearch
set wrapscan
"### Escの2回押しで検索ハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

"### 履歴
set history=1000           " コマンド・検索パターンの履歴数

"#### 文字コード自動判別
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932
set encoding=utf-8
set fileformats=unix,dos,mac

"## 自動修正
if has('autocmd')
  " 保存時に行末の空白を除去する
  autocmd BufWritePre * :%s/\s\+$//ge
  " 保存時にtabをスペースに変換する
"  autocmd BufWritePre * :%s/\t/  /ge
endif

"### ヘルプ
" Ctrl-iでヘルプ
nnoremap <C-i>  :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

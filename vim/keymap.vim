scriptencoding utf-8

" 検索ハイライト消去
noremap <Leader><Leader> :nohlsearch<CR><ESC>
" for NVIM v0.2.0(?) 本来とは逆の挙動をしている気がする
noremap <Leader>p :set nopaste<CR>
noremap <Leader>n :set paste<CR>
noremap <Leader>i :a!<CR>

noremap <Leader>rmsp :%s/\s\+$//ge<CR>

noremap <C-i>  :<C-u>help<Space>
noremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

source ${VIMRUNTIME}/macros/matchit.vim

" for window, buffer
nnoremap <silent> s <Nop>
nnoremap <silent> ss :sp<CR>
nnoremap <silent> sv :vs<CR>
nnoremap <silent> sh <C-w>h
nnoremap <silent> sj <C-w>j
nnoremap <silent> sk <C-w>k
nnoremap <silent> sl <C-w>l
nnoremap <silent> sw <C-w>w
nnoremap <silent> sH <C-w>H
nnoremap <silent> sJ <C-w>J
nnoremap <silent> sK <C-w>K
nnoremap <silent> sL <C-w>L
nnoremap <silent> sr <C-w>r

" close
nnoremap sq :q
nnoremap sQ :bd
nnoremap <C-d> :bd<CR>

" サイズ調整
nnoremap so <C-w>_
nnoremap sO <C-w>\|
nnoremap sf <C-w>_<C-w>\|
nnoremap s0 <C-w>=
nnoremap s= <C-w>=

set showtabline=2
nnoremap [Tag]  <Nop>
nmap     t [Tag]
nnoremap <silent> [Tag]c :tabnew<CR>
nnoremap <silent> [Tag]n :tabnext<CR>
nnoremap <silent> [Tag]p :tabprevious<CR>
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor


""" "for gnu global
""" set tags=./tags,../tags,~/tags
""" nnoremap <Leader>gd :Gtags<Space>
""" nnoremap <Leader>gr :Gtags -r
""" nnoremap <Leader>gf :Gtags -f
""" nnoremap <Leader>gg :Gtags -g
""" nnoremap <Leader>gc :GtagsCursor<Enter>
""" nnoremap <Leader>gu :GtagsUpdate<Enter>

""" " shell
""" nnoremap <Leader>vs :VimShell<Enter>
""" nnoremap <Leader>vf :VimFilerExplorer<Enter>

""" " カーソル下の呼び出し元一覧を出力
""" nnoremap <silent> <Leader>tr  :<C-u>Unite gtags/ref:<CR>
""" " カーソル下の定義元を出力
""" nnoremap <silent> <Leader>td  :<C-u>Unite gtags/def:<CR>
""" " タグファイル内grep
""" nnoremap <silent> <Leader>tg  :<C-u>Unite gtags/grep:<CR>

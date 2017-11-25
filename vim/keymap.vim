scriptencoding utf-8

" 検索ハイライト消去
noremap <Leader><Leader> :nohlsearch<CR><ESC>
" for NVIM v0.2.0(?) 本来とは逆の挙動をしている気がする
noremap <Leader>p :set nopaste<CR>
noremap <Leader>n :set paste<CR>

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


function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}

let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
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

" tagbar
nnoremap <F8> :Tagbar<CR>
"for Quickfix: jump to error
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprevious<CR>
nnoremap <C-h> :clast<CR>
nnoremap <C-l> :cfirst<CR>

""" let g:syntastic_check_on_open=1
""" let g:syntastic_enable_signs=1
""" let g:syntastic_auto_loc_list=1
""" let g:syntastic_mode_map = { 'mode': 'passive',
"""             \ 'active_filetypes': ['ruby', 'javascript','vim'] }
""" let g:syntastic_python_checkers=['pyflakes', 'pep8']
""" let g:syntastic_ruby_checkers = ['rubocop'] " or ['rubocop', 'mri']
""" let g:syntastic_always_populate_loc_list = 1
""" let g:syntastic_error_symbol='✗'
""" let g:syntastic_warning_symbol='⚠'
""" let g:syntastic_style_error_symbol = '✗'
""" let g:syntastic_style_warning_symbol = '⚠'
""" hi SyntasticErrorSign ctermfg=160
""" hi SyntasticWarningSign ctermfg=220

""" " カーソル下の呼び出し元一覧を出力
""" nnoremap <silent> <Leader>tr  :<C-u>Unite gtags/ref:<CR>
""" " カーソル下の定義元を出力
""" nnoremap <silent> <Leader>td  :<C-u>Unite gtags/def:<CR>
""" " タグファイル内grep
""" nnoremap <silent> <Leader>tg  :<C-u>Unite gtags/grep:<CR>

""" au FileType rust nmap gd <Plug>(rust-def)
""" au FileType rust nmap gs <Plug>(rust-def-split)
""" au FileType rust nmap gx <Plug>(rust-def-vertical)
""" au FileType rust nmap <leader>gd <Plug>(rust-doc)

scriptencoding utf-8

let mapleader = "\<Space>"
" Escの2回押しで検索ハイライト消去
noremap <Leader><Leader> :nohlsearch<CR><ESC>
noremap <Leader>cap :mkview<CR>
noremap <Leader>p :set paste<CR>
noremap <Leader>n :set nopaste<CR>
noremap <Leader>ff :VimFiler -split -toggle -no-quit -winwidth=40 -simple<CR>
noremap <Leader>rmsp :%s/\s\+$//ge<CR>

source ${VIMRUNTIME}/macros/matchit.vim

noremap <C-i>  :<C-u>help<Space>
noremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

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

nnoremap tt :tabnew<CR>
nnoremap sn gT
nnoremap sp gt
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

""" "for gnu global
""" set tags=./tags,../tags,~/tags
""" nnoremap <Leader>gd :Gtags<Space>
""" nnoremap <Leader>gr :Gtags -r
""" nnoremap <Leader>gf :Gtags -f
""" nnoremap <Leader>gg :Gtags -g
""" nnoremap <Leader>gc :GtagsCursor<Enter>
""" nnoremap <Leader>gu :GtagsUpdate<Enter>

" Unite
""" nnoremap sT :Unite tab<CR>
""" nnoremap sb :Unite buffer_tab
""" nnoremap sB :Unite buffer

""" nnoremap <Leader>le :Unite git_modified<CR>
""" nnoremap <Leader>lu :Unite git_untracked<CR>
""" nnoremap <Leader>lc :Unite git_cached<CR>
""" nnoremap <Leader>ld :Unite gtags/def<CR>
""" nnoremap <Leader>cf :Unite filetype<CR>

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

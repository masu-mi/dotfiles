scriptencoding utf-8

if has('nvim')
    let g:vim_home = expand('~/.config/nvim')
    let g:rc_dir = expand('~/.config/nvim/rc')
else
    let g:vim_home = expand('~/.config/vim')
    let g:rc_dir = expand('~/.config/vim/rc')
endif

function! s:source_rc(rc_file_name)
    let rc_file = expand(g:rc_dir . '/' . a:rc_file_name)
    if filereadable(rc_file)
        execute 'source' rc_file
    endif
endfunction

let mapleader = "\<Space>"

call s:source_rc('encoding.vim')
call s:source_rc('bundles.vim')
call s:source_rc('basic.vim')
call s:source_rc('keymap.vim')
call s:source_rc('insert.vim')
call s:source_rc('complete')

" 基本カラーリング関連
syntax on
let g:molokai_original=1
colorscheme molokai

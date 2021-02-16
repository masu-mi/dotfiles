scriptencoding utf-8

let &runtimepath = '~/dotfiles/vim' .",". &runtimepath

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

call s:source_rc('dein.vim')
call s:source_rc('encoding.vim')
call s:source_rc('basic.vim')
call s:source_rc('keymap.vim')
call s:source_rc('insert.vim')
call s:source_rc('color.vim')
call s:source_rc('dev-utils.vim')

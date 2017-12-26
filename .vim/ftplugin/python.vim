setlocal textwidth=80
setlocal smarttab
setlocal expandtab
setlocal nosmartindent
setlocal autoindent
setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
setlocal tabstop=2 shiftwidth=2 softtabstop=0

function! s:python_lib_path()
  return split(system('$HOME/dotfiles/scripts/vimenv.py'), '\n')
endfunction

let s:global_tags_path = $HOME."/.cache/tags"
" ライブラリ系 tags ファイルの集約箇所
if !isdirectory(s:global_tags_path)
  silent execute("!mkdir ".s:global_tags_path)
endif
function! s:get_tagdir(path) abort
  return s:global_tags_path."/". substitute(a:path, '/', '', 'g')
endfunction

" 必要なtagsファイルを立ち上げ時に追加する
for path in s:python_lib_path()
  let tagdir_path = s:get_tagdir(path)
  if !isdirectory(tagdir_path)
    silent execute("!mkdir ".tagdir_path)
  endif
  let tag_path = tagdir_path."/tags"
  if !filereadable(tag_path)
    silent execute("!ctags ".g:auto_ctags_tags_args." -f ".tag_path." ".path)
  endif
endfor

let s:base_tags = &tags
function! s:set_tags() abort
  execute('set tags='.s:base_tags)
  for path in s:python_lib_path()
    let tag_path = s:get_tagdir(path)."/tags"
    if filereadable(tag_path)
      execute('set tags+='.tag_path)
    endif
  endfor
endfunction
function! s:clean_tags() abort
  execute('set tags='.s:base_tags)
endfunction
call s:set_tags()
augroup python_tags
  autocmd!
  autocmd WinEnter,BufRead,FileType * if &filetype == 'python' | call s:set_tags() | else | call s:clean_tags() | endif
augroup END

nmap <buffer><nowait> <Leader>ds :split<CR>g<C-]>
nmap <buffer><nowait> <Leader>dv :vsplit<CR>g<C-]>
nmap <buffer><nowait> <Leader>i  K

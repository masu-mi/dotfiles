IndentGuidesDisable
augroup cursor_man
  autocmd!
  autocmd WinEnter,BufRead * if &filetype == 'man' | IndentGuidesDisable | else | IndentGuidesEnable | endif
augroup END

scriptencoding utf-8

nmap <buffer><nowait> <Leader>gd <Plug>(go-def-split)
nmap <buffer><nowait> <Leader>dt <Plug>(go-def-tab)
nmap <buffer><nowait> <Leader>dv <Plug>(go-def-vertical)
nmap <buffer><nowait> <Leader>i <Plug>(go-info)

nmap <buffer><nowait> <Leader>gb <Plug>(go-doc-browser)

nmap <buffer><nowait> <Leader>r <Plug>(go-run)
nmap <buffer><nowait> <Leader>b <Plug>(go-build)
nmap <buffer><nowait> <Leader>t <Plug>(go-test)
nmap <buffer><nowait> <Leader>c <Plug>(go-coverage)

nmap <buffer><nowait> <Leader>a :GoAddTags 
nmap <buffer><nowait> <Leader>p :GoImport 

" for go
" filetype off
" filetype plugin indent off
" set rtp+=${GOROOT}/misc/vim
" autocmd FileType go autocmd BufWritePre <buffer> Fmt
" exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
" set completeopt=menu,preview

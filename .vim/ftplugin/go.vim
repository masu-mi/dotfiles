scriptencoding utf-8

nmap <buffer><nowait> <Leader>ds <Plug>(go-def-split)
nmap <buffer><nowait> <Leader>dv <Plug>(go-def-vertical)
nmap <buffer><nowait> <Leader>i <Plug>(go-info)
nmap <buffer><nowait> <Leader>dt <Plug>(go-def-tab)
nmap <buffer><nowait> <Leader>db <Plug>(go-doc-browser)

nmap <buffer><nowait> <Leader>r <Plug>(go-run)
nmap <buffer><nowait> <Leader>b <Plug>(go-build)
nmap <buffer><nowait> <Leader>t <Plug>(go-test)
nmap <buffer><nowait> <Leader>c <Plug>(go-coverage)

nmap <buffer><nowait> <Leader>a :GoAddTags<Space>
nmap <buffer><nowait> <Leader>p :GoImport<Space>

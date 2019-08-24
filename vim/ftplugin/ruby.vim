" ドキュメント参照
let g:ref_refe_cmd = $HOME.'/.rbenv/shims/refe'

" gtags + pygmentsを使いたい
" メソッド定義元へのジャンプ
" NeoBundle 'szw/vim-tags'
" let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -f .tags -R .  2>/dev/null"
" let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R -f .Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
" set tags+=.tags
" set tags+=.Gemfile.lock.tags
nmap <buffer><nowait> <Leader>ds :split<CR>g<C-]>
nmap <buffer><nowait> <Leader>dv :vsplit<CR>g<C-]>
nmap <buffer><nowait> <Leader>i  K

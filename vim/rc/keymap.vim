scriptencoding utf-8

let mapleader = "\<Space>"

noremap <Leader><Leader> :nohlsearch<CR><ESC>

noremap <Leader>n :set nopaste<CR>
noremap <Leader>p :set paste<CR>
noremap <Leader>i :insert!<CR>
noremap <Leader>a :append!<CR>

noremap <Leader>rts :%s/\s\+$//ge<CR>

noremap <C-h>  :<C-u>help<Space>
noremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>

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
nnoremap sq :q<CR>
nnoremap sQ :bd<CR>

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
nnoremap <silent> [Tag]d :tabclose<CR>
nnoremap <silent> [Tag]h :tab help 
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" packadd matchit

nmap <nowait> <Leader>a :LspCodeAction<CR>
nmap <nowait> <C-i> :LspDocumentFormat<CR>
nmap <nowait> <C-d> :LspHover<CR>
nmap <nowait> <Leader>ds :sp<CR>:LspDefinition<CR>
nmap <nowait> <Leader>dv :vs<CR>:LspDefinition<CR>
nmap <nowait> <Leader>dt :sp<CR>:LspDefinition<CR>:tabnew<CR>

nmap <nowait> <Leader>fix :call FixCurrentBuffer()<CR>
nmap <nowait> <Leader>ren :LspRename<CR>
nmap <nowait> <C-m> :LspDocumentDiagnostics<CR>
nmap <nowait> zz za<CR>

augroup code_fix
  autocmd!
  autocmd BufWritePre go call FixCurrentBuffer()
augroup END

function FixCurrentBuffer()
  LspDocumentFormatSync
  ALEFix
endfunction

nmap <buffer><nowait> <F9> :TestFile<CR>

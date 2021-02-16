scriptencoding utf-8

function! GithubUrl()
  echo system('get-github-url.py '.expand('%'))
endfunction
command! GithubUrl call GithubUrl()

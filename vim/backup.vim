"" バックアップ設定
set backup
set backupdir=~/.backup/vim
"set backupskip
"バックアップ用
if has( "autocmd" )
    autocmd BufWritePre * call UpdateBackupFile()
    function! UpdateBackupFile()
        let dir = strftime("~/.backup/vim/%Y/%m/%d", localtime())
        if !isdirectory(dir)
            let retval = system("mkdir -p ".dir)
            let retval = system("chown 500:500 ".dir)
        endif
        exe "set backupdir=".dir
        unlet dir

        let time = strftime("%H_%M_%S", localtime())
        exe "set backupext=.".time
    endfunction
endif

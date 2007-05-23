" markdown filetype file
if exists("did_load_filetypes")
    finish
endif

augroup markdown
    au BufRead,BufNewFile *.mkd,*.markdown  setf mkd
augroup END

" vim:et:ts=4:sts=4:sw=4:

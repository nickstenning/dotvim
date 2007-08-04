" markdown filetype file
if exists("did_load_filetypes")
    finish
endif

au BufRead,BufNewFile *.mkd,*.markdown setf mkd
au BufRead,BufNewFile *.haml setf haml 
au BufRead,BufNewFile *.sass setf sass 

" vim:et:ts=4:sts=4:sw=4:


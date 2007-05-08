" markdown filetype file
if exists("did_load_filetypes")
  finish
endif
augroup markdown
  au! BufRead,BufNewFile *.mkd,*.markdown	setfiletype mkd
augroup END

" .vimrc file
  
filetype off
call pathogen#runtime_append_all_bundles()

set nocompatible
set encoding=utf-8

let mapleader=","

set nobackup            " do not keep a backup file
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set hlsearch            " highlight search keys
set visualbell          " don't beep, f*&%er
set mouse=a             " mooooose support
set pastetoggle=<F4>    " toggles paste mode
set listchars=tab:>-,trail:-,eol:¶

set tw=78
set nojoinspaces

set ts=2 sts=2 sw=2 expandtab
set smarttab
set showmatch

" Tab helpers
map <leader>te <Esc>:set et<CR>
map <leader>tn <Esc>:set noet<CR>
map <leader>t2 <Esc>:set ts=2 sts=2 sw=2<CR>
map <leader>t4 <Esc>:set ts=4 sts=4 sw=4<CR>
map <leader>t8 <Esc>:set ts=8 sts=8 sw=8<CR>

" Helpers for editing this file
nmap <leader>ve :tabedit $MYVIMRC<CR>
if has("autocmd")
    autocmd BufWritePost .vimrc source $MYVIMRC
endif

" Toggle search highlight
map <leader>h <Esc>:set hls!<CR>

" Toggle showing invisibles
map <leader>l <Esc>:set list!<CR>

" Fix whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Sudo save from inside vim!
cmap w!! %!sudo tee > /dev/null %

noremap Y y$

nnoremap Q gqap
vnoremap Q gq

" visual shifting (reselection after shift)
vnoremap < <gv
vnoremap > >gv

syntax on
filetype on             " enable filetype detection
filetype indent on      " enable filetype-specific indenting
filetype plugin on      " enable filetype-specific plugins
 
colorscheme blackboard
if $term =~ '^screen' && &t_co == 8 | set t_co=256 | endif

autocmd filetype mkd set comments=n:>
autocmd filetype mkd set sts=4 sw=4
autocmd filetype python set sts=4 sw=4
autocmd filetype javascript set sts=2 sw=2

let g:supertabdefaultcompletiontype = "context"
let g:supertabmappingtabliteral = '<s-tab>'

" taglist
map <leader>tt <esc>:tlisttoggle<cr>

let g:tlist_use_right_window = 1
let g:tlist_enable_fold_column = 0

hi link mytaglistfilename keyword

" Project browser
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

set t_RV=
" vim:et:ts=4:sts=4:sw=4:

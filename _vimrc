" .vimrc file

set nocompatible
set encoding=utf-8
  
filetype off
call pathogen#runtime_append_all_bundles()

let mapleader=","

set nobackup            " do not keep a backup file
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set hlsearch            " highlight search keys
set visualbell          " don't beep, f*&%er
set mouse=a             " mooooose support
set pastetoggle=<F4>    " toggles paste mode
set number              " line numbering
set listchars=tab:>-,trail:-,eol:¶

set tw=78
set nojoinspaces

set ts=2 sts=2 sw=2 expandtab
set smarttab
set showmatch

" Tab helpers
map <leader>ie <Esc>:set et<CR>
map <leader>in <Esc>:set noet<CR>
map <leader>i2 <Esc>:set ts=2 sts=2 sw=2<CR>
map <leader>i4 <Esc>:set ts=4 sts=4 sw=4<CR>
map <leader>i8 <Esc>:set ts=8 sts=8 sw=8<CR>

" Helpers for editing this file
nmap <leader>ve :tabedit $MYVIMRC<CR>
autocmd BufWritePost .vimrc source $MYVIMRC

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

" window jumping
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

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
autocmd filetype css set sts=2 sw=2 noet

let g:supertabdefaultcompletiontype = "context"
let g:supertabmappingtabliteral = '<s-tab>'

" strip trailing
autocmd FileType c,cpp,python,ruby,javascript autocmd BufWritePre <buffer> silent! %s/\s\+$//

" taglist
map <leader>m <esc>:TlistToggle<cr>

let g:Tlist_Use_Right_Window = 1
let g:Tlist_Enable_Fold_Column = 0

hi link mytaglistfilename keyword

" Project browser
map <leader>p :NERDTreeFromBookmark 
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\~$']


" vim:et:ts=4:sts=4:sw=4:

" .vimrc file

set nocompatible
set encoding=utf-8

if !exists("g:loaded_pathogen")
    call pathogen#infect()
endif

let mapleader=","

set foldlevelstart=99
set formatoptions=acr2qj
set hlsearch            " highlight search keys
set incsearch           " do incremental searching
set listchars=tab:>-,trail:-,eol:¶
set mouse=a             " mooooose support
set nobackup            " do not keep a backup file
set nojoinspaces
set number              " line numbering
set pastetoggle=<F4>    " toggles paste mode
set ruler               " show the cursor position all the time
set showmatch
set smarttab
set title               " set term title
set ts=2 sts=2 sw=2 expandtab
set ttyfast
set tw=78
set visualbell          " don't beep, f*&%er
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class
set wildmenu

" Helpers for editing this file
nnoremap <leader>ve :tabedit $MYVIMRC<CR>

" NB: the following ! is vital, and prevents this autocmd being set up once
" for every save of the file.
autocmd! bufwritepost .vimrc source $MYVIMRC

" Clear search highlight
nnoremap <leader>h :nohlsearch<CR>

" Toggle showing invisibles
nnoremap <leader>l :set list!<CR>

" Sudo save from inside vim!
cmap w!! %!sudo tee > /dev/null %

" Reformat para
nnoremap Q gqap
vnoremap Q gq

" visual shifting (reselection after shift)
vnoremap < <gv
vnoremap > >gv

" window jumping
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Ack
nnoremap <leader>a :Ack<space>

" folding
nnoremap <space> za
vnoremap <space> zf

" fold focus
nnoremap <leader>z zMzO
vnoremap <leader>z zMzO

" alignment
nnoremap <leader>== :Tab /=<cr>
nnoremap <leader>=> :Tab /=><cr>
nnoremap <leader>=: :Tab /:<cr>

syntax on
filetype on
filetype indent on
filetype plugin on

" set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

autocmd filetype css setlocal sts=2 sw=2 et
autocmd filetype gitcommit setlocal fo+=t
autocmd filetype go setlocal noet
autocmd filetype javascript setlocal sts=2 sw=2
autocmd filetype make setlocal ts=8 sts=8 sw=8 noet
autocmd filetype mkd setlocal comments=n:> sts=4 sw=4 fo+=t
autocmd filetype text setlocal fo+=t
autocmd filetype yaml setlocal ts=2 sts=2 sw=2 et

autocmd filetype python setlocal sts=4 sw=4 et
let g:pymode_lint_checker = "pyflakes"
nnoremap <leader>i :RopeAutoImport<CR>

let g:supertabdefaultcompletiontype = "context"
let g:supertabmappingtabliteral = '<s-tab>'

" strip trailing
autocmd FileType c,cpp,puppet,python,ruby,javascript autocmd BufWritePre <buffer> silent! %s/\s\+$//

" taglist
nnoremap <leader>m :TlistToggle<cr>

let g:Tlist_Use_Right_Window = 1
let g:Tlist_Enable_Fold_Column = 0

hi link mytaglistfilename keyword

" Project browser
nnoremap <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\~$']

" Relative numbering
let g:NumberToggleTrigger = "<leader>n"

" GUI settings
if has("gui_running")
    set guioptions+=e
    set guifont=PragmataPro:h14.00
endif

" vim:et:ts=4:sts=4:sw=4:

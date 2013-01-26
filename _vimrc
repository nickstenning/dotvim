" .vimrc file

set nocompatible
set encoding=utf-8

if !exists("g:loaded_pathogen")
    call pathogen#infect()
endif

let mapleader=","

set foldlevelstart=99
set formatoptions=cr2qj
set hidden              " allow unsaved hidden buffers
set hlsearch            " highlight search keys
set incsearch           " do incremental searching
set listchars=tab:>-,trail:-,eol:¬
set mouse=a
set nobackup            " do not keep a backup file
set nojoinspaces
set number              " line numbering
set pastetoggle=<F4>    " toggles paste mode
set ruler               " show the cursor position all the time
set showmatch
set smarttab
set title               " set term title
set ttyfast
set tw=78
set visualbell
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class
set wildmenu

" Helpers for editing this file
nnoremap <leader>ve :edit $MYVIMRC<CR>
" NB: the following ! is vital, and prevents this autocmd being set up once
" for every save of the file.
autocmd! bufwritepost .vimrc source $MYVIMRC

nnoremap ; :

" basic movement
nnoremap k gk
nnoremap j gj

" window jumping
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" buffer navigation
nnoremap <S-l> :bn<cr>
nnoremap <S-h> :bp<cr>
nnoremap ,b :ls<CR>:buffer<Space>
nnoremap <C-b> :CtrlPBuffer<CR>

" clear search highlight
nnoremap <leader>h :nohlsearch<CR>

" toggle showing invisibles
nnoremap <leader>l :set list!<CR>

" sudo save from inside vim!
cmap w!! %!sudo tee > /dev/null %

" make Y behave like D, C, etc
nnoremap Y y$

" reformat para
nnoremap Q gqap
vnoremap Q gq

" visual shifting (reselection after shift)
vnoremap < <gv
vnoremap > >gv

" set local wd
nnoremap <leader>cd :lcd %:h<CR>

" ack
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
filetype plugin indent on

let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" default indentation
set ts=2 sts=2 sw=2 expandtab

" filetype detection
autocmd bufread *.do setlocal ft=sh

" filetype customisation
autocmd filetype css setlocal sts=2 sw=2 et
autocmd filetype gitcommit setlocal fo+=t
autocmd filetype go setlocal noet
autocmd filetype javascript setlocal sts=2 sw=2
autocmd filetype make setlocal ts=8 sts=8 sw=8 noet
autocmd filetype markdown setlocal comments=n:> sts=4 sw=4 fo+=t fo-=a
autocmd filetype puppet setlocal cms=#\ %s
autocmd filetype text setlocal fo+=t
autocmd filetype yaml setlocal ts=2 sts=2 sw=2 et

autocmd filetype python setlocal sts=4 sw=4 et
let g:pymode_lint_checker = "pyflakes"

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

" Delete empty buffers, specially for files opened with --remote option. This
" function ensures that any empty buffers get deleted immediately.
autocmd BufAdd * :call <SID>DeleteBufferIfEmpty()
function! s:DeleteBufferIfEmpty()
    if bufname('%') == ''
        bwipe
        " This will trigger filetype detection, mainly to trigger syntax highlighting
        doautocmd BufRead
    endif
endfunction

" GUI settings
set guioptions+=e
set guifont=PragmataPro:h14.00

" vim:et:ts=4:sts=4:sw=4:

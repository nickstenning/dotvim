" .vimrc file

set nocompatible
set encoding=utf-8

call pathogen#infect()

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
set autochdir           " automatically chdir to dir of cur file
set title               " set term title
set ttyfast

set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class

set listchars=tab:>-,trail:-,eol:¶

set tw=78
set nojoinspaces

set ts=2 sts=2 sw=2 expandtab
set smarttab
set showmatch

" Helpers for editing this file
nmap <leader>ve :tabedit $MYVIMRC<CR>

" Toggle search highlight
map <leader>h <Esc>:set hls!<CR>

" Toggle showing invisibles
map <leader>l <Esc>:set list!<CR>

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

syntax on
filetype on             " enable filetype detection
filetype indent on      " enable filetype-specific indenting
filetype plugin on      " enable filetype-specific plugins

set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

autocmd filetype mkd setlocal comments=n:> sts=4 sw=4
autocmd filetype javascript setlocal sts=2 sw=2
autocmd filetype css setlocal sts=2 sw=2 et

autocmd filetype go setlocal noet

autocmd filetype python setlocal sts=4 sw=4 et
let g:pymode_lint_checker = "pyflakes"
nnoremap <leader>i :RopeAutoImport<CR>

let g:supertabdefaultcompletiontype = "context"
let g:supertabmappingtabliteral = '<s-tab>'

" strip trailing
autocmd FileType c,cpp,puppet,python,ruby,javascript autocmd BufWritePre <buffer> silent! %s/\s\+$//

" Ack
nnoremap <leader>a :Ack

" fold focus
nnoremap <leader>z zMzO

" taglist
map <leader>m <esc>:TlistToggle<cr>

let g:Tlist_Use_Right_Window = 1
let g:Tlist_Enable_Fold_Column = 0

hi link mytaglistfilename keyword

" Project browser
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\~$']

" Relative numbering
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <leader>n :call NumberToggle()<CR>

:au FocusLost * :set number
:au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

if has("gui_running")
    set guioptions+=e
    set guifont=PragmataPro:h14.00

    if has("mac")
        macm File.Close key=<nop>
        map <silent> <D-w> <Esc>:bd<CR>
    endif
endif


" vim:et:ts=4:sts=4:sw=4:

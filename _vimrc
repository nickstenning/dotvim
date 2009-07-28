" .vimrc file

" no compat mode for vi users
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"set grepprg=ack
"set grepformat=%f:%l:%m

set encoding=utf-8

let mapleader = ","

syntax on               " uh, well, yeah. we *do* want syntax hl

set nobackup            " do not keep a backup file
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set hlsearch            " highlight search keys
set visualbell          " don't beep, f*&%er
set mouse=a             " mooooose support
set pastetoggle=<F4>    " toggles paste mode
set number              " show line numbers
set whichwrap=b,s,h,l,~,<,>,[,]
set listchars=tab:>-,trail:-,eol:¶

set tw=78
set fo+=tcoqlwn2
set nojoinspaces

if has('gui')
    if has('gui_macvim')
        set guifont=Monaco:h12.00
    elseif has('gui_win32')
        set guifont=Inconsolata:h12.00
    endif
endif

set tags=./tags,./../tags,./../../tags,./../../../tags,tags

set expandtab
set softtabstop=2
set shiftwidth=2
set smarttab
set showmatch
set cpoptions-=m

" Allow use of 'application' key instead of Esc
"noremap [29~ <Esc>
"inoremap [29~ <Esc>

noremap OM <CR>
noremap! OM <CR>

" Tab helpers
map <leader>tm <Esc>:set noet sts=4 sw=4<CR>
map <leader>t2 <Esc>:set et sts=2 sw=2<CR>
map <leader>t4 <Esc>:set et sts=4 sw=4<CR>
map <leader>t8 <Esc>:set et sts=8 sw=8<CR>

" Taglist
map <leader>tt <Esc>:TlistToggle<CR>

" Helpers for editing this file
map <leader>ve <Esc>:e $MYVIMRC<CR>
map <leader>vs <Esc>:source $MYVIMRC<CR>

" Toggle search highlight
map <leader>h <Esc>:set hls!<CR>

" Toggle showing invisibles
map <leader>l <Esc>:set list!<CR>

" , #perl # comments
map ,# :s/^/#/<CR>

" Jamis's fuzzy_file_finder
let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70

map <leader>f :FuzzyFinderTextMate<CR>
map <leader>b :FuzzyFinderBuffer<CR>

" Project browser
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" Sudo save from inside vim!
cmap w!! %!sudo tee > /dev/null %

noremap Y y$

nnoremap Q gqap
vnoremap Q gq

" visual shifting (reselection after shift)
vnoremap < <gv
vnoremap > >gv

filetype on             " enable filetype detection
filetype indent on      " enable filetype-specific indenting
filetype plugin on      " enable filetype-specific plugins

colorscheme blackboard
if $TERM =~ '^screen' && &t_Co == 8 | set t_Co=256 | endif

autocmd FileType mkd set comments=n:>
autocmd FileType mkd set sts=4 sw=4

autocmd FileType javascript set sts=4 sw=4

augroup ruby
    autocmd FileType ruby set sts=2 sw=2

    " plain annotations
    map <silent> <F10> !xmpfilter -a<cr>
    nmap <silent> <F10> V<F10>
    imap <silent> <F10> <ESC><F10>a

    " Test::Unit assertions; use -s to generate RSpec expectations instead
    map <silent> <S-F10> !xmpfilter -u<cr>
    nmap <silent> <S-F10> V<S-F10>
    imap <silent> <S-F10> <ESC><S-F10>a

    " Annotate the full buffer
    " I actually prefer ggVG to %; it's a sort of poor man's visual bell 
    nmap <silent> <F11> mzggVG!xmpfilter -a<cr>'z
    imap <silent> <F11> <ESC><F11>

    " assertions
    nmap <silent> <S-F11> mzggVG!xmpfilter -u<cr>'z
    imap <silent> <S-F11> <ESC><S-F11>a

    " Add # => markers
    vmap <silent> <F12> !xmpfilter -m<cr>
    nmap <silent> <F12> V<F12>
    imap <silent> <F12> <ESC><F12>a

    " Remove # => markers
    vmap <silent> <S-F12> ms:call RemoveRubyEval()<CR>
    nmap <silent> <S-F12> V<S-F12>
    imap <silent> <S-F12> <ESC><S-F12>a

    function! RemoveRubyEval() range
        let begv = a:firstline
        let endv = a:lastline
        normal Hmt
        set lz
        execute ":" . begv . "," . endv . 's/\s*# \(=>\|!!\).*$//e'
        normal 'tzt`s
        set nolz
        redraw
    endfunction
augroup END

augroup mail
    autocmd FileType mail map <leader>d2u mzggVG:s/=0D//g<CR>'z
augroup END

augroup lisp
    map [9 [(
    map ]0 ])]
    map <C-F9> /(<CR>
    map <C-F10> /)<CR>
augroup END

let g:GetLatestVimScripts_allowautoinstall=1
let g:SuperTabDefaultCompletionType = "context"

" vim:et:ts=4:sts=4:sw=4:

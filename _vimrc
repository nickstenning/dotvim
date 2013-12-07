" .vimrc file

set nocompatible
set encoding=utf-8
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" GitHub
Bundle 'SirVer/ultisnips'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'altercation/vim-colors-solarized'
Bundle 'chrisbra/csv.vim'
Bundle 'evanmiller/nginx-vim-syntax'
Bundle 'godlygeek/tabular'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'jszakmeister/vim-togglecursor'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'mileszs/ack.vim'
Bundle 'mineiro/vim-latex'
Bundle 'nickstenning/vim-yankstack'
Bundle 'pangloss/vim-javascript'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'stephpy/vim-yaml'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'uggedal/go-vim'

" vim-scripts
Bundle 'AutoTag'
Bundle 'gnupg'
Bundle 'taglist.vim'

set colorcolumn=+1
set clipboard+=unnamed
set foldlevelstart=99
set formatoptions=cr2qj
set hidden " allow unsaved hidden buffers
set hlsearch
set incsearch
set list
set listchars=tab:▸\ ,trail:·,extends:»,precedes:«
set nobackup
set nojoinspaces
set number " line numbering
set pastetoggle=<F4>
set ruler " show the cursor position all the time
set ttimeoutlen=50 " minimize delay leaving insert mode
set tw=80
set wildignore=*.o,*.pyc,*.pyo,*.bak,*.map
set wildmode=longest,list

syntax on
filetype plugin indent on

let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" default indentation
set ts=2 sts=2 sw=2 expandtab

" filetype detection
autocmd bufnewfile,bufread *.do   setlocal ft=sh
autocmd bufnewfile,bufread *.json setlocal ft=javascript

" filetype customisation
autocmd filetype css        setlocal sts=2 sw=2 et
autocmd filetype gitcommit  setlocal fo+=t tw=72
autocmd filetype go         setlocal noet nolist
autocmd filetype javascript setlocal sts=2 sw=2
autocmd filetype make       setlocal ts=8 sts=8 sw=8 noet
autocmd filetype markdown   setlocal comments=n:> sts=4 sw=4 fo+=t fo-=a
autocmd filetype puppet     setlocal cms=#\ %s
autocmd filetype python     setlocal sts=4 sw=4 et tw=79
autocmd filetype text       setlocal fo+=t
autocmd filetype rst        setlocal fo+=t
autocmd filetype yaml       setlocal ts=2 sts=2 sw=2 et

" Helpers for editing this file
nnoremap <leader>ve :execute("edit ".resolve($MYVIMRC))<CR>
" The ! prevents this autocmd being set up once for every save of the file
autocmd! bufwritepost .vimrc,_vimrc execute("source ".resolve($MYVIMRC))

" basic movement
noremap k gk
noremap j gj
nnoremap <up> :echoe "use k"<CR>
nnoremap <down> :echoe "use j"<CR>
nnoremap <left> :echoe "use h"<CR>
nnoremap <right> :echoe "use l"<CR>

" windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ack
nnoremap <leader>a :Ack<space>

" alignment
nnoremap <leader>== :Tab /=<cr>
nnoremap <leader>=> :Tab /=><cr>
nnoremap <leader>=: :Tab /:\zs/l0r1<cr>
nnoremap <leader>=, :Tab /,\zs/l0r1<cr>

" buffer navigation
nnoremap <leader>b :ls<CR>:buffer<Space>
nnoremap <C-\> :CtrlPBuffer<CR>
nnoremap <C-P> :CtrlPLastMode --dir<CR>

" cd: set local wd
nnoremap <leader>cd :lcd %:h<CR>:echo getcwd()<CR>

" folding
nnoremap <space> za
vnoremap <space> zf

" fold focus
nnoremap <leader>z zMzO
vnoremap <leader>z zMzO

" clear search highlight
nnoremap <leader>h :nohlsearch<CR>

" toggle showing invisibles
nnoremap <leader>l :set list!<CR>

" reformat para
nnoremap Q gqap
vnoremap Q gq

" sudo save from inside vim!
cnoremap w!! %!sudo tee > /dev/null %

" visual shifting (reselection after shift)
vnoremap < <gv
vnoremap > >gv

" yankstack
nmap <Esc>p <Plug>yankstack_substitute_older_paste
nmap <Esc>n <Plug>yankstack_substitute_newer_paste

" make Y behave like D, C, etc
nnoremap Y y$

" strip trailing
autocmd FileType c,coffee,cpp,gitcommit,go,html,markdown,puppet,python,ruby,rst,javascript,yaml autocmd BufWritePre <buffer> silent! %s/\s\+$//

" taglist
nnoremap <leader>m :TlistToggle<cr>
let g:Tlist_Use_Right_Window = 1
let g:Tlist_Enable_Fold_Column = 0

" Project browser
nnoremap <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\~$']

" Relative numbering
let g:NumberToggleTrigger = "<leader>n"

command! -nargs=+ ITerm :call ExecuteInITerm(<q-args>)
function! ExecuteInITerm(cmd)
    execute(":silent !iterm '".a:cmd."' &")
    redraw!
endfunction
nnoremap <leader>t :call ExecuteInITerm("<C-v><C-[>OA")<CR>

" Syntastic: JSL conf file
let g:syntastic_javascript_jsl_conf = "~/.vim/jsl.conf"

" GUI settings
set guioptions+=e
set guifont=PragmataPro:h14.00

" vim:et:ts=4:sts=4:sw=4:

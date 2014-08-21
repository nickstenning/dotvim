" .vimrc file

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" GitHub
Bundle 'SirVer/ultisnips'
Bundle 'bling/vim-airline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'chase/vim-ansible-yaml'
Bundle 'chrisbra/csv.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'fatih/vim-go'
Bundle 'godlygeek/tabular'
Bundle 'groenewege/vim-less'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'jszakmeister/vim-togglecursor'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'mhinz/vim-signify'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'nickstenning/vim-yankstack'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

call vundle#end()
filetype plugin indent on

set colorcolumn=+1
set clipboard+=unnamed
set foldlevelstart=99
try
    set formatoptions=cr2qj
catch /E539/
    set formatoptions=cr2q
endtry
set hidden " allow unsaved hidden buffers
set hlsearch
set list
set nobackup
set nojoinspaces
set number " line numbering
set pastetoggle=<F4>
set tw=80
set wildignore=*.o,*.pyc,*.pyo,*.bak,*.map
set wildmode=longest,list

syntax enable

let g:solarized_termcolors=256
set background=dark
colorscheme solarized
highlight clear SignColumn

if has("Mac")
    let g:airline_powerline_fonts = 1
endif

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

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  " .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

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

" Project browser
nnoremap <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\~$']

command! -nargs=+ ITerm :call ExecuteInITerm(<q-args>)
function! ExecuteInITerm(cmd)
    execute(":silent !iterm '".a:cmd."' &")
    redraw!
endfunction
nnoremap <leader>t :call ExecuteInITerm("<C-v><C-[>OA")<CR>

" Supertab
let g:SuperTabDefaultCompletionType = 'context'

" Jedi
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0

" Syntastic
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['jsl']
let g:syntastic_javascript_jsl_conf = "~/.vim/jsl.conf"

" GUI settings
set guioptions+=e
set guifont=PragmataPro:h14.00

" vim:et:ts=4:sts=4:sw=4:

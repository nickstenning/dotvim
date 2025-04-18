" .vimrc file

set nocompatible

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'junegunn/vim-plug'

" GitHub
Plug 'SirVer/ultisnips'
Plug 'rebelot/kanagawa.nvim'
Plug 'bling/vim-airline'
Plug 'chrisbra/csv.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'github/copilot.vim'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'hashivim/vim-terraform'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jszakmeister/vim-togglecursor'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mhinz/vim-signify'
Plug 'michaeljsmith/vim-indent-object'
Plug 'pangloss/vim-javascript'
Plug 'preservim/tagbar'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vimoutliner/vimoutliner'

call plug#end()

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
set splitbelow
set splitright
set tw=80
set wildignore=*.o,*.pyc,*.pyo,*.bak,*.map
set wildmode=longest,list

set background=dark
silent! colorscheme kanagawa
highlight clear SignColumn

let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" default indentation
set ts=2 sts=2 sw=2 expandtab

" filetype detection
autocmd bufnewfile,bufread *.do   setlocal ft=sh
autocmd bufnewfile,bufread *.json setlocal ft=javascript

" filetype customisation
autocmd filetype gitcommit  setlocal fo+=t tw=72
autocmd filetype go         setlocal nolist
autocmd filetype go         nmap <leader>d <Plug>(go-def)
autocmd filetype mail       setlocal fo+=aw
autocmd filetype markdown   setlocal comments=n:> fo+=t fo-=a
autocmd filetype puppet     setlocal cms=#\ %s
autocmd filetype python     setlocal tw=79
autocmd filetype text       setlocal fo+=t
autocmd filetype rst        setlocal fo+=t
autocmd filetype rust       setlocal omnifunc=ale#completion#OmniFunc

" project-specific settings
autocmd BufRead,BufNewFile ~/src/replicate-web/** let g:ale_command_wrapper = '~/src/replicate-web/script/run web'

" Helpers for editing this file
nnoremap <leader>ve :execute("edit ~/.vimrc")<CR>
" The ! prevents this autocmd being set up once for every save of the file
autocmd! bufwritepost .vimrc,_vimrc execute("source ".resolve($MYVIMRC))

" basic movement
noremap k gk
noremap j gj
nnoremap <up> :echoe "use k"<CR>
nnoremap <down> :echoe "use j"<CR>
nnoremap <left> :echoe "use h"<CR>
nnoremap <right> :echoe "use l"<CR>

command! -bar -nargs=? -bang Scratch :silent enew<bang>|set buftype=nofile bufhidden=hide noswapfile buflisted filetype=<args> modifiable

if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case
  set grepformat=%f:%l:%c:%m

  let g:ctrlp_user_command = 'rg %s --files --color never --hidden --glob "!.git/*"'
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  set grepprg=ag\ --vimgrep
  set grepformat=%f:%l:%c:%m

  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --ignore=.git -g ""'
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
let g:yankstack_map_keys = 0
nmap <Esc>p <Plug>yankstack_substitute_older_paste
nmap <Esc>n <Plug>yankstack_substitute_newer_paste
call yankstack#setup()

" make Y behave like D, C, etc
nnoremap Y y$

" Project browser
" nnoremap <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\~$']

" Python
if filereadable(expand("~/.venv/nvim/bin/python"))
    let g:python3_host_prog = expand("~/.venv/nvim/bin/python")
endif

" ALE
let g:ale_linters = {
\   'rust': ['analyzer'],
\   'python': ['ruff', 'pyright'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['gofmt', 'goimports'],
\   'python': ['ruff_format'],
\   'rust': ['rustfmt'],
\   'terraform': ['terraform'],
\}
let g:ale_fix_on_save = 1
let g:ale_go_golangci_lint_executable = "go run github.com/golangci/golangci-lint/cmd/golangci-lint@latest"
let g:ale_go_golangci_lint_package = 1
let g:ale_rust_analyzer_executable = trim(system('rustup which rust-analyzer'))

" Supertab
let g:SuperTabDefaultCompletionType = 'context'

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Jedi
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0

" GUI settings
set guioptions+=e
set guifont=PragmataPro:h14.00

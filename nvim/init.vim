call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/vim-easy-align'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-sort-motion'
Plug 'tpope/vim-commentary'

Plug 'sbdchd/neoformat'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

Plug 'Vimjas/vim-python-pep8-indent'

Plug 'docunext/closetag.vim'

Plug 'vim-airline/vim-airline'

Plug 'fatih/vim-go'

Plug 'mbbill/undotree'

Plug 'avakhov/vim-yaml'

Plug 'majutsushi/tagbar'

Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'
Plug 'romainl/flattened'

call plug#end()

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox'

map <c-x><c-l> <plug>(fzf-complete-line)
inoremap jj <ESC>

let mapleader = "\<Space>"

filetype plugin indent on
syntax on
set encoding=utf-8

" Stop being so lazy
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

vnoremap . :norm.<CR>
" Line numbers/ highlight colour settings
:set relativenumber
:set number

:set numberwidth=4
:set cpoptions+=n

:set cursorline

" tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=999
set showmode
set showcmd
set hidden
set wildmenu

set visualbell
set ruler
set undofile

nnoremap / /\v
vnoremap / /\v



set list
set showbreak=↪

set listchars=tab:‐›,nbsp:.,eol:¬,trail:•,extends:»,precedes:«
set showmatch

nnoremap <tab> %
vnoremap <tab> %

noremap <leader>b :Buffers<cr>
noremap <leader>f :Files<cr>
noremap <leader>g :! generate-tags<cr>
noremap <leader>= :vsp<cr><C-W>l<cr>
noremap <leader>- :sp<cr><C-W>j<cr>
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>
noremap <leader>u :UndotreeToggle<cr>
noremap <leader>s :Find<cr>
noremap <leader>] :TagbarToggle<cr>



nnoremap <leader><space> :noh<cr>


nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h


set wrap
set textwidth=79
let &colorcolumn=join(range(81,999),",")

autocmd BufWritePre *.py :%s/\s\+$//e

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)


" Python settings
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79  " PEP-8

let g:neoformat_enabled_python = ['autopep8']

noremap <leader>r :Neoformat<cr>


" YAML settings
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

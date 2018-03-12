call plug#begin('~/.local/share/nvim/plugged')

"Sensible vim defaults
Plug 'tpope/vim-sensible'


"========= UI =========

"Status/tabline
Plug 'vim-airline/vim-airline'

"Displays tags of the current file (classes, functions etc.)
Plug 'majutsushi/tagbar'

"Allows traversing undo history as a tree
Plug 'mbbill/undotree'

"Allows switching between vim and other tmux panes
Plug 'christoomey/vim-tmux-navigator'


"========= Editing/motions =========

"Automatically closes HTML/XML tags
Plug 'docunext/closetag.vim'

"Motion plugin - jump to a location based on two characters
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

"Allows sorting via `gs` motion
Plug 'christoomey/vim-sort-motion'

"Comments out blocks of vim text objs using `gc`
Plug 'tpope/vim-commentary'

"Allows alignment of several lines around vim text objs
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


"========= Snippets =========

" Use <TAB> for all insert completion
Plug 'ervandew/supertab'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'cwood/ultisnips-terraform-snippets'


"========= File utilities (linting, autocompletion) =========

"Autocompletion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

"Asychronous Lint Engine, on the fly linting of files
Plug 'w0rp/ale'

"Formats a file using formatter defined for its filetype
Plug 'sbdchd/neoformat'

"Fuzzy searching of files using FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Better diffing
Plug 'chrisbra/vim-diff-enhanced'


"========= Colour schemes =========

"Dark, retro colour scheme
Plug 'morhetz/gruvbox'
"Solarized colour scheme
Plug 'romainl/flattened'


"========= Languages =========

Plug 'avakhov/vim-yaml'
Plug 'hashivim/vim-terraform'
Plug 'andrewstuart/vim-kubernetes'
Plug 'fatih/vim-go'

"Makes vim indentation PEP8 compatible
Plug 'Vimjas/vim-python-pep8-indent'


"========= SCM/Git =========

"Git plugin
Plug 'tpope/vim-fugitive'

"Displays git symbols in the gutter, e.g. +,-,~
Plug 'airblade/vim-gitgutter'


call plug#end()

"========================== Colours & UI settings ============================

set termguicolors  " Ensure we're running in 256 true colour mode

" Gruvbox theme config; see https://github.com/morhetz/gruvbox/wiki/Configuration
let g:gruvbox_italic         = 1
let g:gruvbox_bold           = 1
let g:gruvbox_underline      = 1
let g:gruvbox_undercurl      = 1
let g:gruvbox_contrast_light = 'hard'
let g:airline_theme          = 'gruvbox'

colorscheme gruvbox
set background=dark


"========================== ALE settings ============================
let g:ale_sign_error                 = '⤫'
let g:ale_sign_warning               = '⚠'
let g:airline#extensions#ale#enabled = 1


"========================== Buffers & Files ============================

filetype plugin indent on   "load filetype specific plugins & indentation settings
syntax on  "syntax highlighting
set encoding=utf-8

set hidden     "if opening a new buffer when the current one has unwritten changes, just "hide" the current one instead of closing it
set undofile    "Save undo history for files

"========================== Key mapping ============================


" leader key
let mapleader = "\<Space>"

inoremap jj <ESC>  "Hit jj in insert mode to trigger ESC

" Make backspace behaviour sane
set backspace=eol,start,indent

" Stop being so lazy - remove arrow key config
noremap <Up>     <nop>
noremap <Down>   <nop>
noremap <Left>   <nop>
noremap <Right>  <nop>

inoremap <Up>    <nop>
inoremap <Down>  <nop>
inoremap <Left>  <nop>
inoremap <Right> <nop>

"in Visual mode, hitting . applies the same action to all lines
vnoremap . :norm.<CR>

"Make TAB work in normal & visual modes
nnoremap <tab> %
vnoremap <tab> %

"Leader key shortcuts

"show open buffers
noremap <leader>b :Buffers<cr>

"search in files with ripgrep
noremap <leader>s :Find<cr>
"search filenames with FZF
noremap <leader>f :Files<cr>
"generate tags for tagtree
noremap <leader>g :! generate-tags<cr>
"Splits, vertical & horizontal
noremap <leader>= :vsp<cr><C-W>l<cr>
noremap <leader>- :sp<cr><C-W>j<cr>
"write & quit
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>

"open undotree/tagbar
noremap <leader>u :UndotreeToggle<cr>
noremap <leader>] :TagbarToggle<cr>

"run Go tests
noremap <F10> :wall<cr>:GoTest<cr>
noremap <F9> :wall<cr>:GoBuild<cr>

"remove search highlighting
nnoremap <leader><space> :noh<cr>

"move between vim panes with Ctrl-J etc.
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h


"=================================== UI: General ==============================

set showmode   "display current mode in statusbar
set showcmd    "display current command input in statusbar

set wildmenu   "autocompletion in vim command mode
set wildmode=longest:full,full

set wrap "wrap text visually, but only insert linebreaks when told to
set textwidth=79  "wrapping width"

set visualbell  "Flash screen instead of beeping when I do something wrong
set ruler       "Display current line,column & relative position at bottom

" Mouse integration!
if has('mouse')
  set mouse=a
endif


"====================== UI: Line numbers/highlighting =========================
" Set "hybrid" line number mode - display the current line number, but relative
" line numbers for all other lines. See https://jeffkreeftmeijer.com/vim-number/
:set relativenumber
:set number

" Set width of number column & use for wrapped text 
:set numberwidth=3
:set cpoptions+=n

" Highlight current line
:set cursorline

" keep current line/cursor centred on screen
set scrolloff=999


" ==================================== Tabs ==================================

set tabstop=4     " default to tabs = 4 spaces (normally overridden by FileType settings)
set shiftwidth=4  " when shifting with <</>>, by default shift by this amount
set softtabstop=4 " control columns used when TAB is hit in insert mode
set expandtab     " Convert tabs to spaces


" ================================= Searching =================================
"Activate "very magic" mode when searching, similar to regex stuff. See `:help \v
nnoremap / /\v
vnoremap / /\v

"When searching, ignore case if the search string is all lowercase, but make it
"case sensitive if there is an uppercase character
set smartcase
set ignorecase


"Uses ripgrep to recursively search files under the current directory
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


" =============================== File display ===============================

set showmatch  "Display matching brace

" Display whitespace characters
set list
set showbreak=↪
set listchars=tab:‐›,nbsp:.,eol:¬,trail:•,extends:»,precedes:«

set infercase   "ignore case in autocomplete
let &colorcolumn=join(range(80,999),",") "visual margin for line width


" =============================== Snippets ===============================


let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" =============================== Python files ===============================

autocmd BufWritePre *.py :%s/\s\+$//e  "remove trailing whitespace
" Python settings
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79  " PEP-8

let g:neoformat_enabled_python = ['autopep8']

noremap <leader>r :Neoformat<cr>

" =============================== YAML files ===============================
autocmd BufWritePre *.yaml :%s/\s\+$//e  "remove trailing whitespace
" two space tabs for YAML
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


" =============================== Terraform files ===============================

" vim-terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1
autocmd FileType terraform setlocal commentstring=#%s


" =============================== Golang files ===============================

let g:go_fmt_command = "goimports"

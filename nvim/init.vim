call plug#begin('~/.local/share/nvim/plugged')

"Sensible vim defaults
Plug 'tpope/vim-sensible'

" Async job control
Plug 'prabirshrestha/async.vim'

"========= UI =========

"Status/tabline
Plug 'vim-airline/vim-airline'

"Displays tags of the current file (classes, functions etc.)
Plug 'majutsushi/tagbar'

"Allows traversing undo history as a tree
Plug 'mbbill/undotree'

"Allows switching between vim and other tmux panes
Plug 'christoomey/vim-tmux-navigator'

"Shows indent guides
Plug 'Yggdroot/indentLine'

"Tree explorer
Plug 'scrooloose/nerdtree'

"Pretty ()
Plug 'junegunn/rainbow_parentheses.vim'

" Highlight yank
Plug 'machakann/vim-highlightedyank'

Plug 'ncm2/float-preview.nvim'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'


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

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'cwood/ultisnips-terraform-snippets'


"========= File utilities (linting, autocompletion) =========

"Autocompletion
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

"Asychronous Lint Engine, on the fly linting of files
" Plug 'w0rp/ale'

"Formats a file using formatter defined for its filetype
Plug 'sbdchd/neoformat'

"Fuzzy searching of files using FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'yuki-ycino/fzf-preview.vim'

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
Plug 'fatih/vim-go', {  'tag': 'v1.22', 'do': ':GoUpdateBinaries' }

Plug 'Shougo/neco-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


Plug 'wellle/tmux-complete.vim'

Plug 'rodjek/vim-puppet'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" TEST govim
" Plug 'file:///Users/milesbryant/src/github.com/myitcv/govim'

"Makes vim indentation PEP8 compatible
Plug 'Vimjas/vim-python-pep8-indent'

Plug 'heavenshell/vim-pydocstring'


"========= SCM/Git =========

"Git plugin
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

"Displays git symbols in the gutter, e.g. +,-,~
Plug 'mhinz/vim-signify'


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

" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

colorscheme gruvbox
set background=dark

" Git gutter symbols
let g:signify_vcs_list=['git']
let g:signify_realtime = 1
let g:signify_line_highlight = 0
highlight link SignifySignAdd             DiffAdd
highlight link SignifySignChange          DiffChange
highlight link SignifySignDelete          DiffDelete
highlight link SignifySignChangeDelete    SignifySignChange
highlight link SignifySignDeleteFirstLine SignifySignDelete

set inccommand=split

"========================== ALE settings ============================
" let g:ale_sign_error                 = '❌'
" let g:ale_sign_warning               = '⚠️'
" let g:ale_sign_info = 'ℹ️'
" let g:airline#extensions#ale#enabled = 1
" let g:ale_lint_delay = 100
" let g:ale_set_highlights = 1
" let g:ale_sign_column_always = 1
" highlight link ALEErrorLine Error



"========================== Buffers & Files ============================

filetype plugin indent on   "load filetype specific plugins & indentation settings
syntax on  "syntax highlighting
set encoding=utf-8

set hidden     "if opening a new buffer when the current one has unwritten changes, just "hide" the current one instead of closing it
set undofile    "Save undo history for files

set modelines=0
set nomodeline

"========================== Key mapping ============================


" leader key
let mapleader = "\<Space>"

" Hit jj in insert mode to trigger ESC
inoremap jj <ESC>

" Make backspace behaviour sane
set backspace=eol,start,indent

"in Visual mode, hitting . applies the same action to all lines
vnoremap . :norm.<CR>

"Make TAB work in normal & visual modes
nnoremap <tab> %
vnoremap <tab> %

"Leader key shortcuts

"show open buffers
noremap <leader>b :FzfPreviewBuffers<cr>

noremap <C-e> :let @c="<C-r><C-r>c"
noremap <leader>e :!zsh -c 'tmux send-keys -t {right-of} C-c C-c "<C-r><C-r>c" Enter'<cr><cr>

"search in files with ripgrep
noremap <leader>s :Find<cr>
"search filenames with FZF
noremap <leader>f :FzfPreviewMrwFiles<cr>

nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]p     :<C-u>FzfPreviewFromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatus<CR>
nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>FzfPreviewJumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChanges<CR>
nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>FzfPreviewProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationList<CR>

"Search file history
noremap <leader>hf :History<cr>
"Search command history
noremap <leader>hc :History:<cr>
"Search search history
noremap <leader>hs :History/<cr>

noremap <leader>1 :SignifyToggleHighlight<cr>

"Search windows
noremap <leader>i :Windows<cr>

"Search snippets
noremap <leader>n :Snippets<cr>

"Search nvim commands
noremap <leader>; :Commands<cr>

"Search commits
noremap <leader>ca :Commits<cr>
noremap <leader>cb :BCommits<cr>

" Yank & put from clipboard register
noremap <leader>y "+y
noremap <leader>p "+p

"generate tags for tagtree
noremap <leader>gt :! generate-tags<cr>
"Splits, vertical & horizontal
noremap <leader>= :vsp<cr><C-W>l<cr>
noremap <leader>- :sp<cr><C-W>j<cr>
"write & quit
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>
noremap <leader>x :x<cr>
noremap <leader>z :xall<cr>

"open undotree/tagbar
noremap <leader>u :UndotreeToggle<cr>
noremap <leader>] :TagbarToggle<cr>
noremap <leader>t :NERDTreeToggle<cr>

autocmd FileType markdown noremap <leader>gp <Plug>MarkdownPreviewToggle<cr>

"Go commands

autocmd FileType go noremap gt :GoTest<cr>
autocmd FileType go noremap gft :GoTestFunc<cr>

autocmd FileType go noremap gb :<C-u>call <SID>build_go_files()<cr>
autocmd FileType go noremap gv :GoDoc<cr>
autocmd FileType go noremap <leader>g :GoDeclsDir<cr>

nnoremap <C-.> :cnext<cr>
nnoremap <C-,> :cprevious<cr>
nnoremap <C-/> :cclose<cr>

"remove search highlighting
nnoremap <leader><space> :noh<cr>

"move between vim panes with Ctrl-J etc.
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <C--> <Plug>(pydocstring)

"=================================== UI: General ==============================

set showmode   "display current mode in statusbar
set showcmd    "display current command input in statusbar

set wildmenu   "autocompletion in vim command mode
set wildmode=longest:full,full

set wrap "wrap text visually, but only insert linebreaks when told to
set textwidth=0  "wrapping width"

set visualbell  "Flash screen instead of beeping when I do something wrong
set ruler       "Display current line,column & relative position at bottom

" Mouse integration!
if has('mouse')
  set mouse=a
endif

"========================== UI: indent guides =============================
let g:indentLine_setColors = 0
let g:indentLine_color_term = 167
let g:indentLine_char = ''

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

" let g:fzf_preview_command = "bat --style=numbers --color=always {-1}"
" let g:fzf_preview_layout = 'belowright split new'
" let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --glob "!.git/*" --glob "!vendor/"'

" ==================================== Goyo/limelight ==================================
"

au FileType markdown Goyo

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


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

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" =============================== Python files ===============================

autocmd BufWritePre *.py :%s/\s\+$//e  "remove trailing whitespace
" Python settings
au FileType python set autoindent
au FileType python set smartindent
au FileType python set tabstop=4 shiftwidth=4 expandtab
au FileType python set textwidth=79  " PEP-8

let g:neoformat_enabled_python = ['black', 'isort']

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
"
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

au FileType go set autowrite

 " can I has all the syntax highlights plz
 let g:go_highlight_types = 1
 let g:go_highlight_fields = 1
 let g:go_highlight_functions = 1
 let g:go_highlight_function_calls = 1
 let g:go_highlight_operators = 1
 let g:go_highlight_extra_types = 1
 let g:go_highlight_build_constraints = 1
 let g:go_highlight_generate_tags = 1

 let g:go_fmt_command = "goimports"
 " let g:go_def_mode='gopls'

 let g:go_term_enabled = 1

 let g:go_auto_type_info = 1
 let g:go_auto_sameids = 1

 " update info a bit quicker (vim gets pretty sluggish for values lower than
 " this)
 let g:go_updatetime = 2000


 " open everything in quickfix window
 let g:go_list_type = "quickfix"

 " run :GoBuild or :GoTestCompile based on the go file
 function! s:build_go_files()
   let l:file = expand('%')
   if l:file =~# '^\f\+_test\.go$'
     call go#test#Test(0, 1)
   elseif l:file =~# '^\f\+\.go$'
     call go#cmd#Build(0)
   endif
 endfunction

let g:go_gopls_use_placeholders = 1


" ============================ Deoplete completion ============================

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({ 'omni_patterns': { 'go': '[^. *\t]\.\w*' }, 'camel_case': v:true })
call deoplete#enable_logging("DEBUG", $HOME."/.deoplete.log")



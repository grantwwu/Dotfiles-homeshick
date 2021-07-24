set nocompatible              " be iMproved, required

set autochdir  "Change directory to currently open file
set autoindent  "autoindent on new lines
set background=dark
set backspace=indent,eol,start  "Better backspacing
set clipboard^=unnamed,unnamedplus
set encoding=utf-8 "UTF-8 character encoding
set equalalways  "Split windows equal size
set expandtab  " Expand tabs into spaces
set formatoptions=croq  "Enable comment line auto formatting
set hlsearch  "Highlight on search
set ignorecase  "Search ignoring case
set incsearch  "Start searching immediately
set lazyredraw  "Don't redraw while running macros (faster)
set linebreak  "Only wrap on 'good' characters for wrapping
set mouse=a
set nostartofline "Vertical movement preserves horizontal position
set number " Show line numbers
set ruler  "Show bottom ruler
set scrolloff=5  "Never scroll off
set shiftwidth=2  "4 space shift
set showcmd " Show multicharacter commands as they are being typed
set showmatch  "Highlight matching braces
set smartcase  "Search using smartcase
set softtabstop=2  "Tab spaces in no hard tab mode
set t_Co=256 "256 color
set tabstop=2  "2 space tabs
set title  "Set window title to file
set ttyfast  "Speed up vim
set wildignore+=*.o,*.obj,*.class,*.swp,*.pyc "Ignore junk files
set wildmode=longest,list  "Better unix-like tab completion
set wrap  "Visually wrap lines

set termguicolors

" Correct RGB escape codes for vim inside tmux
if !has('nvim') && $TERM ==# 'screen-256color'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set background=dark
colorscheme solarized8

filetype plugin indent on    " required

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["tex"] }

let g:syntastic_python_checkers = ['flake8']
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e

" SML signature files
au BufRead,BufNewFile *.sig setlocal filetype=sml

" C1 signature files
au BufRead,BufNewFile *.c1 setlocal filetype=c0

" Processing files
au BufRead,BufNewFile *.pde setlocal filetype=java

" Syntax highlighting and stuff
syntax enable

" Get rid of warning on save/exit typo
command WQ wq
command Wq wq
command W w
command Q q

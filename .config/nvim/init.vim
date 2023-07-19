start                   " insert mode by default
set textwidth=72
set tabstop=4
set shiftwidth=0
set expandtab           " convert tabs to spaces
set autoindent
set hlsearch            " highlight search results
set number              " display line numbers
set ignorecase          " set search to case insensitive
set smartcase           " except when the search has capital letters
set ruler
set updatetime=250      " make gitgutter more responsive
set nocompatible
filetype plugin on

call plug#begin('~/.local/share/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'mechatroner/rainbow_csv'
Plug 'elzr/vim-json'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'chrisbra/Colorizer'
Plug 'sheerun/vim-polyglot'
call plug#end()


" color scheme theme
syntax enable
set background=dark
let g:solarized_termtrans = 1   " fixes ugly grey bg
colorscheme solarized


let g:colorizer_auto_color = 1
let g:show_spaces_that_precede_tabs=1

set spell spelllang=en_us



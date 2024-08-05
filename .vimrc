syntax enable

call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'preservim/vim-indent-guides'
Plug 'rstacruz/vim-closer'
Plug 'ap/vim-css-color'
call plug#end()

colorscheme dracula

let g:indent_guides_enable_on_vim_startup = 1

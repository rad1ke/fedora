call plug#begin()
Plug 'arcticicestudio/nord-vim', { 'branch': 'master' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Jorengarenar/vim-MvVis'
Plug 'Yggdroot/identLine'
Plug 'psliwka/vim-smoothie'
call plug#end()

colorscheme nord
map <silent> <C-n> :NERDTreeToggle<CR>

set mouse=a
set clipboard+=unnamedplus
set incsearch ignorecase smartcase hlsearch
set relativenumber
set encoding=utf-8
set emoji

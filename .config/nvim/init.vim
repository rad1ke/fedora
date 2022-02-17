call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'arcticicestudio/nord-vim', { 'branch': 'master' }
call plug#end()

colorscheme nord
map <silent> <C-n> :NERDTreeToggle<CR>

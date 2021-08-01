set hidden
set list
set formatoptions+=mM

set number
set relativenumber

set colorcolumn=80

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

set smartcase
set smartindent

set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undo
set undofile

set mouse=a

" Color scheme
"set termguicolors

vmap < <gv
vmap > >gv

" source the fzf vim plugin if installed
if filereadable("/usr/share/doc/fzf/examples/fzf.vim")
   so /usr/share/doc/fzf/examples/fzf.vim
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/goyo.vim'

" Initialize plugin system
call plug#end()

"packadd! goyo.vim
map <Leader>g :Goyo<CR>

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

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

" Configure Plugins
" Enable true color support
set termguicolors

" gruvbox color scheme
let g:gruvbox_italic=1
colo gruvbox
set cursorline

" Setup nvim-colorizer
lua require'colorizer'.setup()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Leader-g to toggle Goyo
map <Leader>g :Goyo<CR>

call plug#begin()

" Plugins
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/noice.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'github/copilot.vim'

call plug#end()

lua require("noice").setup()
lua require("nvim-tree").setup()

syntax on
set number
set cursorline
set termguicolors
filetype indent on
set lazyredraw
set showmatch
set incsearch

colorscheme catppuccin-frappe

set tabstop=2 shiftwidth=2 expandtab
set shada='50,<1000,s100,:0,n~/nvim-shada/main.shada

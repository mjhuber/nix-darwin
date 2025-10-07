call plug#begin()

" Plugins (removed duplicates)
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/noice.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'dense-analysis/ale'
Plug 'github/copilot.vim'
Plug 'folke/which-key.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

call plug#end()

" Lua configurations
lua << EOF
require("noice").setup()
require("nvim-tree").setup()
require("which-key").setup({
  plugins = {
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
    },
  },
  delay = 0,
})
require("toggleterm").setup{
  size = 20,
  open_mapping = [[<M-t>]], -- ⌥ + t (Option + T)
  direction = 'horizontal',
  shade_terminals = true,
  start_in_insert = true,
  persist_size = true,
  persist_mode = true,
}
EOF

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

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
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'nvim-mini/mini.nvim', { 'branch': 'stable' }
Plug 'nvim-tree/nvim-web-devicons'
call plug#end()

let mapleader = ","

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

require("which-key").add({
  { "<leader>s",  group = "Splits" },
  { "<leader>sh", "<C-w>s", desc = "Horizontal Split" },
  { "<leader>sv", "<C-w>v", desc = "Vertical Split" },
  { "<leader>sj", "<C-w>h", desc = "Left Split" },
  { "<leader>sl", "<C-w>l", desc = "Right Split" },
  { "<leader>si", "<C-w>k", desc = "Up Split" },
  { "<leader>sk", "<C-w>j", desc = "Down Split" },
}, { mode = "n" })
EOF

syntax on
set number
set cursorline
set termguicolors
filetype indent on
set lazyredraw
set showmatch
set incsearch
set clipboard=unnamedplus

colorscheme catppuccin-frappe

set tabstop=2 shiftwidth=2 expandtab
set shada='50,<1000,s100,:0,n~/nvim-shada/main.shada

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

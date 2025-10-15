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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'karb94/neoscroll.nvim'
call plug#end()

let mapleader = ","

" coc settings
let g:coc_global_extensions = [
    \ 'coc-docker',
    \ 'coc-elixir',
    \ 'coc-go',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-lua',
    \ 'coc-markdownlint',
    \ 'coc-prettier',
    \ 'coc-pyright',
    \ 'coc-sh',
    \ 'coc-toml',
    \ 'coc-yaml'
    \ ]

" Lua configurations
lua << EOF
require("noice").setup()

-- nvim-tree config
local api = require("nvim-tree.api")

require("nvim-tree").setup({
  actions = {
    open_file = {
      -- optional: avoids the window-picker stealing splits
      window_picker = { enable = false },
    },
  },
  on_attach = function(bufnr)
    -- 1) load all default mappings (gives you v/s/t/<CR>/etc.)
    api.config.mappings.default_on_attach(bufnr)

    -- 2) (optional) explicitly ensure v/s do what you want
    local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }
    vim.keymap.set('n', 'v', api.node.open.vertical,   vim.tbl_extend('force', opts, { desc = 'Open: Vertical Split' }))
    vim.keymap.set('n', 's', api.node.open.horizontal, vim.tbl_extend('force', opts, { desc = 'Open: Horizontal Split' }))

    -- (optional) leader versions
    vim.keymap.set('n', '<leader>sv', api.node.open.vertical,   { buffer = bufnr, desc = 'Open: Vertical Split' })
    vim.keymap.set('n', '<leader>sh', api.node.open.horizontal, { buffer = bufnr, desc = 'Open: Horizontal Split' })
  end,
})
-- nvim-tree config

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
  { "<leader>f", group = "Find" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Grep" },

  { "<leader>s",  group = "Splits" },
  { "<leader>sh", "<C-w>s", desc = "Horizontal Split" },
  { "<leader>sv", "<C-w>v", desc = "Vertical Split" },
  { "<leader>sj", "<C-w>h", desc = "Left Split" },
  { "<leader>sl", "<C-w>l", desc = "Right Split" },
  { "<leader>si", "<C-w>k", desc = "Up Split" },
  { "<leader>sk", "<C-w>j", desc = "Down Split" },

  { "<leader>n", group = "nvim-tree" },
  { "<leader>nv", function()
      require("nvim-tree.api").node.open.vertical()
      vim.cmd('wincmd L') -- move to far right
    end, desc = "Open in vertical split" },

  { "<leader>nh", function()
      require("nvim-tree.api").node.open.horizontal()
    end, desc = "Open in horizontal split" },

  -- CoC LSP Mappings
  { "<leader>g", group = "GoTo" },
  { "<leader>gd", "<Plug>(coc-definition)", desc = "GoTo Definition" },
  { "<leader>gtd", "<Plug>(coc-type-definition)", desc = "GoTo Type Definition" },
  { "<leader>gi", "<Plug>(coc-implementation)", desc = "Go to Implementation" },
  { "<leader>gr", "<Plug>(coc-references)", desc = "Go to References" },

}, { mode = "n" })

EOF

syntax on
set clipboard=unnamedplus
set confirm
set cursorline
set endofline
set expandtab
set fixendofline
set ignorecase
set incsearch
set lazyredraw
set mouse=a
set nowrap
set number
set scrolloff=8
set shiftwidth=4
set showmatch
set sidescrolloff=8
set signcolumn=yes:2
set smartcase
set spell
set splitright
set tabstop=4
set termguicolors
set title
set wildmode=longest:full,full
filetype indent on

colorscheme catppuccin-frappe

set shada='50,<1000,s100,:0,n~/nvim-shada/main.shada

nnoremap r <C-r>

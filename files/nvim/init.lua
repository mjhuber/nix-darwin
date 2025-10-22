local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

-- Plugins
Plug("itchyny/lightline.vim")
Plug("airblade/vim-gitgutter")
Plug("catppuccin/nvim", { as = "catppuccin" })
Plug("MunifTanjim/nui.nvim")
Plug("rcarriga/nvim-notify")
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("folke/noice.nvim")
Plug("nvim-tree/nvim-tree.lua")
Plug("junegunn/fzf", { ["do"] = vim.fn["fzf#install"] })
Plug("dense-analysis/ale")
Plug("github/copilot.vim")
Plug("folke/which-key.nvim")
Plug("akinsho/toggleterm.nvim", { tag = "*" })
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", { tag = "0.1.8" })
Plug("nvim-mini/mini.nvim", { branch = "stable" })
Plug("nvim-tree/nvim-web-devicons")
Plug("fatih/vim-go", { ["do"] = ":GoUpdateBinaries" })
Plug("neoclide/coc.nvim", { branch = "release" })
Plug("karb94/neoscroll.nvim")
Plug("stevearc/conform.nvim")

vim.call("plug#end")

-- Leader key
vim.g.mapleader = ","

-- CoC settings
vim.g.coc_global_extensions = {
	"coc-docker",
	"coc-elixir",
	"coc-go",
	"coc-html",
	"coc-json",
	"coc-lua",
	"coc-markdownlint",
	"coc-prettier",
	"coc-pyright",
	"coc-sh",
	"coc-terraform",
	"coc-toml",
	"coc-yaml",
}

require("noice").setup()

-- nvim-tree config
local api = require("nvim-tree.api")

require("nvim-tree").setup({
	filters = {
		custom = { ".git", "node_modules", ".cache" },
	},
	actions = {
		open_file = {
			window_picker = { enable = false },
		},
	},
	on_attach = function(bufnr)
		api.config.mappings.default_on_attach(bufnr)

		local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }
		vim.keymap.set(
			"n",
			"v",
			api.node.open.vertical,
			vim.tbl_extend("force", opts, { desc = "Open: Vertical Split" })
		)
		vim.keymap.set(
			"n",
			"s",
			api.node.open.horizontal,
			vim.tbl_extend("force", opts, { desc = "Open: Horizontal Split" })
		)

		vim.keymap.set("n", "<leader>sv", api.node.open.vertical, { buffer = bufnr, desc = "Open: Vertical Split" })
		vim.keymap.set("n", "<leader>sh", api.node.open.horizontal, { buffer = bufnr, desc = "Open: Horizontal Split" })
	end,
})

-- which-key setup
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

-- toggleterm setup
require("toggleterm").setup({
	size = 20,
	open_mapping = [[<M-t>]],
	direction = "horizontal",
	shade_terminals = true,
	start_in_insert = true,
	persist_size = true,
	persist_mode = true,
})

-- conform
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "isort" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		go = { "gofmt", "goimports" },
		rust = { "rustfmt" },
		sh = { "shfmt" },
		terraform = { "terraform_fmt" },
		tf = { "terraform_fmt" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

-- telecope
require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "^.git/" },
		hidden = true,
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

-- which-key mappings
require("which-key").add({
	{ "<leader>f", group = "Find" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Grep" },

	{ "<leader>s", group = "Splits" },
	{ "<leader>sh", "<C-w>s", desc = "Horizontal Split" },
	{ "<leader>sv", "<C-w>v", desc = "Vertical Split" },
	{ "<leader>sj", "<C-w>h", desc = "Left Split" },
	{ "<leader>sl", "<C-w>l", desc = "Right Split" },
	{ "<leader>si", "<C-w>k", desc = "Up Split" },
	{ "<leader>sk", "<C-w>j", desc = "Down Split" },

	{ "<leader>n", group = "nvim-tree" },
	{ "<leader>nt", "<cmd>NvimTreeToggle<cr>", desc = "Toggle nvim-tree" },
	{ "<leader>nf", "<cmd>NvimTreeFocus<cr>", desc = "Focus nvim-tree" },
	{
		"<leader>nv",
		function()
			require("nvim-tree.api").node.open.vertical()
			vim.cmd("wincmd L")
		end,
		desc = "Open in vertical split",
	},

	{
		"<leader>nh",
		function()
			require("nvim-tree.api").node.open.horizontal()
		end,
		desc = "Open in horizontal split",
	},

	{
		"<leader>ne",
		function()
			require("nvim-tree.api").tree.expand_all()
		end,
		desc = "Expand all top level dirs",
	},

	{ "<leader>g", group = "GoTo" },
	{ "<leader>gd", "<Plug>(coc-definition)", desc = "GoTo Definition" },
	{ "<leader>gtd", "<Plug>(coc-type-definition)", desc = "GoTo Type Definition" },
	{ "<leader>gi", "<Plug>(coc-implementation)", desc = "Go to Implementation" },
	{ "<leader>gr", "<Plug>(coc-references)", desc = "Go to References" },
}, { mode = "n" })

-- Vim options
vim.cmd("syntax on")
vim.cmd("filetype indent on")

vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.endofline = true
vim.opt.expandtab = true
vim.opt.fixendofline = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.showmatch = true
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes:2"
vim.opt.smartcase = true
vim.opt.spell = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.wildmode = "longest:full,full"

vim.cmd("colorscheme catppuccin-frappe")
vim.opt.shada = "'50,<1000,s100,:0,n~/nvim-shada/main.shada"
vim.keymap.set("n", "r", "<C-r>", { noremap = true })

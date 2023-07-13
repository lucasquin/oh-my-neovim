local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- Commons
	{ "nvim-tree/nvim-web-devicons" },
	{ "nvim-lua/plenary.nvim" },

	-- Status bar
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- Colorscheme
	{ "Mofiqul/dracula.nvim" },

	-- Syntax
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
	},

	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"s1n7ax/nvim-window-picker",
		},
	},

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- Editor
	{ "preservim/nerdcommenter" },
	{ "fedepujol/move.nvim" },
	{ "norcalli/nvim-colorizer.lua" },
	{ "windwp/nvim-autopairs" },

	-- Git
	{ "sindrets/diffview.nvim" },
	{ "lewis6991/gitsigns.nvim", enabled = vim.fn.executable("git") == 1, ft = "gitcommit" },

	-- Autocompletion
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },

	-- Snippets
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
	{ "saadparwaiz1/cmp_luasnip" },

	-- LSP
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "onsails/lspkind.nvim" },
	{ "nvimdev/lspsaga.nvim", commit = "a224b2ac682fddd894f665a474a4c31fa0f138c2" },
	{ "jose-elias-alvarez/typescript.nvim" },

	-- Formatting & Linting
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "jay-babu/mason-null-ls.nvim" },

	-- ChatGPT
	{ "jackMort/ChatGPT.nvim" },

	-- Highlight local cursor
	{ "tzachar/local-highlight.nvim" },

	-- Autoclose inative buffer'
	{ "axkirillov/hbac.nvim" },

	-- DataBase
	{ "tpope/vim-dadbod" },
	{ "kristijanhusak/vim-dadbod-completion" },
}

local opts = {}

require("lazy").setup(plugins, opts)

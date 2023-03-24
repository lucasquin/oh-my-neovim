local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {

	-- Dracula colorscheme
	{ 'Mofiqul/dracula.nvim' },

	-- Tresitter
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = { "windwp/nvim-ts-autotag", "JoosepAlviste/nvim-ts-context-commentstring" },
		build = ':TSUpdate'
	},

	-- Web devicons
	{ "nvim-tree/nvim-web-devicons", enabled = vim.g.icons_enabled },

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		enabled = vim.fn.executable "git" == 1,
		ft = "gitcommit",
	},

	-- Neotree
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		cmd = "Neotree",
		init = function() vim.g.neo_tree_remove_legacy_commands = true end,
	},

	-- Autopairs
	{ "windwp/nvim-autopairs" },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				enabled = vim.fn.executable "make" == 1,
				build = "make"
			},
		},
	},

	-- Mason
	{ "williamboman/mason.nvim" },

	-- Lspconfig
	{ "neovim/nvim-lspconfig",  dependencies = { "williamboman/mason-lspconfig.nvim" } },

	-- Null-ls
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			{
				"jay-babu/mason-null-ls.nvim",
				opts = {
					automatic_setup = true
				}
			}
		}
	},

	-- Lspkind
	{ "onsails/lspkind.nvim", enabled = vim.g.icons_enabled },

	-- Luasnip
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },

	-- CMP
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
		}
	}
}

local opts = {}

require("lazy").setup(plugins, opts)

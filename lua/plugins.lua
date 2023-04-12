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

	{ 'Mofiqul/dracula.nvim' },

	{
		'mawkler/modicator.nvim',
		dependencies = 'Mofiqul/dracula.nvim',
		init = function()
			vim.o.cursorline = true
			vim.o.number = true
			vim.o.termguicolors = true
		end,
	},

	{ 'jackMort/ChatGPT.nvim' },

	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = { "windwp/nvim-ts-autotag", "JoosepAlviste/nvim-ts-context-commentstring" },
		build = ':TSUpdate'
	},

	{ "nvim-tree/nvim-web-devicons", enabled = vim.g.icons_enabled },

	{ "MunifTanjim/nui.nvim" },

	{ 'tzachar/local-highlight.nvim' },

	{ 'nvim-lualine/lualine.nvim' },

	{ 'preservim/nerdcommenter' },

	{ 'norcalli/nvim-colorizer.lua' },

	{
		"lewis6991/gitsigns.nvim",
		enabled = vim.fn.executable "git" == 1,
		ft = "gitcommit",
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		cmd = "Neotree",
		init = function() vim.g.neo_tree_remove_legacy_commands = true end,
	},

	{ "windwp/nvim-autopairs" },

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

	{ "williamboman/mason.nvim" },

	{ "neovim/nvim-lspconfig",  dependencies = { "williamboman/mason-lspconfig.nvim" } },

	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{
				"jay-babu/mason-null-ls.nvim",
				opts = {
					automatic_setup = true
				}
			}
		}
	},

	{ "onsails/lspkind.nvim", enabled = vim.g.icons_enabled },
	{ "L3MON4D3/LuaSnip",     dependencies = { "rafamadriz/friendly-snippets" } },

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

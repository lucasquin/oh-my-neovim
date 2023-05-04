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

	-- Dependencies
	{ 'nvim-lua/plenary.nvim' },
	{ 'nvim-tree/nvim-web-devicons' },
	{ "MunifTanjim/nui.nvim" },

	{ 'samodostal/image.nvim',           dependencies = 'm00qek/baleia.nvim' },
	{ 'kevinhwang91/nvim-ufo',           dependencies = 'kevinhwang91/promise-async' },
	{ 'neovim/nvim-lspconfig',           dependencies = { 'williamboman/mason-lspconfig.nvim' } },
	{ 'L3MON4D3/LuaSnip',                dependencies = { 'rafamadriz/friendly-snippets' } },
	{ 'mawkler/modicator.nvim',          dependencies = 'Mofiqul/dracula.nvim' },
	{ "jose-elias-alvarez/null-ls.nvim", dependencies = { { 'jay-babu/mason-null-ls.nvim' } } },
	{ 'nvim-treesitter/nvim-treesitter', dependencies = { 'windwp/nvim-ts-autotag',	'JoosepAlviste/nvim-ts-context-commentstring' } },
	{ 'lewis6991/gitsigns.nvim',         enabled = vim.fn.executable 'git' == 1, ft =	'gitcommit' },
	{ 'nvim-neo-tree/neo-tree.nvim',     cmd = 'Neotree' },
	{ 'onsails/lspkind.nvim' },
	{ 'jackMort/ChatGPT.nvim' },
	{ 'sindrets/diffview.nvim' },
	{ 'tzachar/local-highlight.nvim' },
	{ 'nvim-lualine/lualine.nvim' },
	{ 'preservim/nerdcommenter' },
	{ 'norcalli/nvim-colorizer.lua' },
	{ 'windwp/nvim-autopairs' },
	{ 'Mofiqul/dracula.nvim' },
	{ 'williamboman/mason.nvim' },
	{ 'fedepujol/move.nvim'},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				enabled = vim.fn.executable "make" == 1,
				build = "make"
			},
		},
	},

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

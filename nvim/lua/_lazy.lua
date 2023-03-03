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
	'Mofiqul/dracula.nvim',
	'nvim-tree/nvim-web-devicons',
	'nvim-lualine/lualine.nvim',
	'preservim/nerdcommenter',
	'windwp/nvim-autopairs',
	'nvim-tree/nvim-tree.lua',
	'norcalli/nvim-colorizer.lua',
	'nvim-treesitter/nvim-treesitter',
	'lewis6991/gitsigns.nvim',
	'tzachar/local-highlight.nvim',

	-- Telescope.
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		dependencies = { {
			'nvim-lua/plenary.nvim'
		} }
	},

	-- LSP.
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',

	-- Completion and snippets.
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
	'rafamadriz/friendly-snippets'
}

local opts = {}

require("lazy").setup(plugins, opts)

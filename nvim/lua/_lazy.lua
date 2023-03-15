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
	{ 'hrsh7th/cmp-nvim-lsp' }, 
	{ 'hrsh7th/nvim-cmp' },
	{ 'jay-babu/mason-null-ls.nvim' },
	{ 'jose-elias-alvarez/null-ls.nvim' },
	{ 'jose-elias-alvarez/null-ls.nvim' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'lewis6991/gitsigns.nvim' }, 
	{ 'Mofiqul/dracula.nvim' }, 
	{ 'neovim/nvim-lspconfig' },
	{ 'NMAC427/guess-indent.nvim' },
	{ 'norcalli/nvim-colorizer.lua' }, 
	{ 'nvim-lua/plenary.nvim' },
	{ 'nvim-lualine/lualine.nvim' }, 
	{ 'nvim-telescope/telescope.nvim' },
	{ 'nvim-tree/nvim-tree.lua' },
	{ 'nvim-tree/nvim-web-devicons' },
	{ 'nvim-treesitter/nvim-treesitter' },
	{ 'onsails/lspkind.nvim' },
	{ 'preservim/nerdcommenter' },
	{ 'rafamadriz/friendly-snippets' },
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'Shatur/neovim-session-manager' },
	{ 'stevearc/aerial.nvim' },
	{ 'tzachar/local-highlight.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'williamboman/mason.nvim' },
	{ 'windwp/nvim-autopairs' },
	{ 'windwp/nvim-ts-autotag' }, 
}


local opts = {}

require("lazy").setup(plugins, opts)

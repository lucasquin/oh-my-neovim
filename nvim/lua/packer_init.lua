-- Automatically install packer.
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file.
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use.
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install plugins bellow.
return packer.startup(function(use)
  -- Packer, manage itself.
  use 'wbthomason/packer.nvim'

  -- Dracula colorscheme.
  use 'Mofiqul/dracula.nvim'

  -- Plenary.
  use "nvim-lua/plenary.nvim"

  -- Dev icons.
  use 'nvim-tree/nvim-web-devicons'

  -- Nerd commenter for coment.
  use 'preservim/nerdcommenter'

  -- Nvim statusline plugin.
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      opt = true
    }
  }
  -- Nvim Treesitter configurations and abstraction layer.
  use 'nvim-treesitter/nvim-treesitter'

  -- Find, Filter, Preview, Pick.
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- Autopairs for Nvim.
  use {
    'windwp/nvim-autopairs'
  }

  -- A completion plugin pack for Nvim.
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets'
  }

  -- Configs for Nvim LSP.
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- A file explorer tree for Nvim.
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  }

  -- Nvim colorizer.
  use 'norcalli/nvim-colorizer.lua'

  -- Git integration for buffers.
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  -- Modicator.
  use {
    'mawkler/modicator.nvim',
    after = 'dracula.nvim',
    setup = function()
      vim.o.cursorline = true
      vim.o.number = true
      vim.o.termguicolors = true
    end,
    config = function()
      require('plugins.modicator')
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim.
  if Packer_bootstrap then
    require('packer').sync()
  end
end)

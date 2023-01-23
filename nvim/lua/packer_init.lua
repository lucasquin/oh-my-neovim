---------------------------------------------------------------------------------------------------
-- Plugin manager configuration file
---------------------------------------------------------------------------------------------------

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

---------------------------------------------------------------------------------------------------
-- Install plugins here
---------------------------------------------------------------------------------------------------
return packer.startup(function(use)
  -- Packer, manage itself
  use 'wbthomason/packer.nvim'

  -- Dracula color scheme
  use 'Mofiqul/dracula.nvim'

  -- NoNeckPain for centralize buffer
  use {"shortcuts/no-neck-pain.nvim", tag = "*" }

  -- Plenary for telescope
  use "nvim-lua/plenary.nvim"

  -- Dev icons
  use 'nvim-tree/nvim-web-devicons'

  -- Nerd commenter for coment
  use 'preservim/nerdcommenter'

  -- Airline theme for statusbar
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- Telescope for live grep and find files
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end
  }

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)

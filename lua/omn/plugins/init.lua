---@diagnostic disable: different-requires

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  require "omn.plugins.neo-tree",
  require "omn.plugins.nvim-treesitter",
  require "omn.plugins.mason",
  require "omn.plugins.telescope",
  require "omn.plugins.nvim-autopairs",
  require "omn.plugins.indent-blankline",
  require "omn.plugins.ccc",
  require "omn.plugins.nvim-cmp",
  require "omn.plugins.nvim-lsp",
  require "omn.plugins.conform",
  require "omn.plugins.lspsaga",
  require "omn.plugins.gitsigns",
  require "omn.plugins.comment",
  require "omn.plugins.nvim-dap",
  require "omn.plugins.lualine",
  require "omn.plugins.bufferline",
  require "omn.plugins.tokyonight",
  require "omn.plugins.nvim-ts-autotag",
  require "omn.plugins.move",
  require "omn.plugins.template-string",
  require "omn.plugins.nvim-lint",
  require "omn.plugins.nvim-ufo",
  require "omn.plugins.statuscol",
  require "omn.plugins.eagle",
  require "omn.plugins.trouble",
}

local opts = {
  install = { colorscheme = { "tokyonight-night" } },
  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}

require("lazy").setup(plugins, opts)

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
  require "neobr.plugins.neo-tree",
  require "neobr.plugins.nvim-treesitter",
  require "neobr.plugins.mason",
  require "neobr.plugins.telescope",
  require "neobr.plugins.nvim-autopairs",
  require "neobr.plugins.indent-blankline",
  require "neobr.plugins.ccc",
  require "neobr.plugins.nvim-cmp",
  require "neobr.plugins.nvim-lsp",
  require "neobr.plugins.conform",
  require "neobr.plugins.lspsaga",
  require "neobr.plugins.gitsigns",
  require "neobr.plugins.comment",
  require "neobr.plugins.nvim-dap",
  require "neobr.plugins.lualine",
  require "neobr.plugins.bufferline",
  require "neobr.plugins.dracula",
  require "neobr.plugins.nvim-ts-autotag",
  require "neobr.plugins.move",
  require "neobr.plugins.template-string",
  require "neobr.plugins.nvim-lint",
  require "neobr.plugins.nvim-ufo",
}

local opts = {
  install = { colorscheme = { "dracula" } },
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

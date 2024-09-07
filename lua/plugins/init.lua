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
  require "plugins.colorscheme",
  require "plugins.nvim-treesitter",
  require "plugins.neo-tree",
  require "plugins.mason",
  require "plugins.telescope",
  require "plugins.nvim-autopairs",
  require "plugins.indent-blankline",
  require "plugins.nvim-cmp",
  require "plugins.nvim-lsp",
  require "plugins.gitsigns",
  require "plugins.comment",
  require "plugins.nvim-dap",
  require "plugins.lualine",
  require "plugins.nvim-ts-autotag",
  require "plugins.template-string",
  require "plugins.nvim-lint",
  require "plugins.nvim-conform",
  require "plugins.lpssaga",
  require "plugins.tiny-devicons",
  -- require "plugins.ccc",
  require "plugins.statuscol",
  require "plugins.nvim-ufo",
  require "plugins.diagflow",
  require "plugins.local-highlight",
}

local opts = {
  install = {
    colorscheme = {
      "tokyonight",
    },
  },
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

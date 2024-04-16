return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local lspsaga = require "lspsaga"

    lspsaga.setup {
      definition = {
        keys = {
          edit = "<CR>",
          quit = { "q", "<ESC>" },
        },
      },
      finder = {
        keys = {
          edit = "<CR>",
          quit = { "q", "<ESC>" },
        },
      },
      ui = {
        sign = false,
      },
      symbol_in_winbar = {
        enable = false,
      },
    }
  end,
}

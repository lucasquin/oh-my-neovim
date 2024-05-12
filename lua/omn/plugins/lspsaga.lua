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
      lightbulb = {
        sign = false,
      },
      ui = {
        sign = false,
        border = "rounded",
        code_action = "",
      },
      symbol_in_winbar = {
        enable = false,
      },
    }
  end,
}

return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup {
      symbol_in_winbar = {
        enable = false,
      },
      code_action = {
        keys = {
          exec = "<CR>",
          quit = { "q", "<ESC>" },
        },
      },
      definition = {
        keys = {
          edit = "<CR>",
          quit = { "q", "<ESC>" },
        },
      },
      rename = {
        in_select = false,
        keys = {
          exec = "<CR>",
          quit = "<ESC>",
        },
      },
      ui = {
        code_action = "󰌵",
      },
    }
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}

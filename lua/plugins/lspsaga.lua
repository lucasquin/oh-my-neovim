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
          quit = { "<ESC>" },
        },
      },
      definition = {
        keys = {
          edit = "<CR>",
          quit = { "<ESC>" },
        },
      },
      rename = {
        keys = {
          exec = "<CR>",
          quit = { "<ESC>" },
        },
      },
      finder = {
        keys = {
          quit = { "<ESC>" },
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

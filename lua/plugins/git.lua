return {
  "lewis6991/gitsigns.nvim",
  enabled = vim.fn.executable "git" == 1,
  config = function()
    require("gitsigns").setup {
      current_line_blame = false,
      signcolumn = false,
      signs = {
        delete = { text = "󰍵" },
        changedelete = { text = "󱕖" },
      },
    }
  end,
}

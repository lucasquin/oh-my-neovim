return {
  "axelvc/template-string.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("template-string").setup {}
  end,
}

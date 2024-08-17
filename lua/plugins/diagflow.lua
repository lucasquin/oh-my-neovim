return {
  "dgagn/diagflow.nvim",
  config = function()
    require("diagflow").setup {
      scope = "line",
      show_borders = true,
    }
  end,
}

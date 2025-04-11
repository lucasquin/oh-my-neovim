return {
  "tzachar/local-highlight.nvim",
  config = function()
    require("local-highlight").setup {
      animate = {
        enabled = false,
      },
    }
  end,
}

return {
  "chrisgrieser/nvim-origami",
  event = "VeryLazy",
  opts = {},
  config = function()
    require("origami").setup {
      useLspFoldsWithTreesitterFallback = true,
      pauseFoldsOnSearch = true,
      foldtext = {
        enabled = true,
        padding = 3,
        lineCount = {
          template = "%d lines", -- `%d` is replaced with the number of folded lines
          hlgroup = "Comment",
        },
        diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
        gitsignsCount = true, -- requires `gitsigns.nvim`
        disableOnFt = { "snacks_picker_input" }, ---@type string[]
      },
      autoFold = {
        enabled = true,
        kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
      },
      foldKeymaps = {
        setup = true, -- modifies `h`, `l`, and `$`
        hOnlyOpensOnFirstColumn = false,
      },
    }
  end,
  init = function()
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
  end,
}

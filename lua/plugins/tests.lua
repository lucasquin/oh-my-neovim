return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nsidorenco/neotest-vstest",
  },
  config = function()
    require("neotest").setup {
      log_level = 1, -- For verbose logs
      adapters = {
        require "neotest-vstest",
      },
      icons = {
        expanded = "",
        child_prefix = "",
        child_indent = "",
        final_child_prefix = "",
        non_collapsible = "",
        collapsed = "",
        passed = "",
        running = "",
        failed = "",
        unknown = "",
        skipped = "",
      },
    }
  end,
}

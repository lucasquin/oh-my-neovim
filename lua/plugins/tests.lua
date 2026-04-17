return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nsidorenco/neotest-vstest",
    "fredrikaverpil/neotest-golang",
    "jfpedroza/neotest-elixir",
  },
  config = function()
    require("neotest").setup {
      log_level = 1,
      adapters = {
        require "neotest-vstest",
        require "neotest-golang",
        require "neotest-elixir",
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

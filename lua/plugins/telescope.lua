return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  tag = "0.1.6",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("telescope").setup {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = " ",
        layout_config = {
          horizontal = {
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
      },

      extensions_list = { "themes", "terms" },
      extensions = {},
    }
  end,
}

return {
  "nvim-telescope/telescope.nvim",
  event = "BufWinEnter",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-media-files.nvim",
  },
  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local themes = require "telescope.themes"

    telescope.setup {
      defaults = {
        prompt_prefix = "   ",
        mappings = {
          i = {
            ["<C-L>"] = actions.cycle_history_next,
            ["<C-H>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<Esc>"] = actions.close,
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          themes.get_cursor {
            on_complete = {
              function()
                vim.cmd "stopinsert"
              end,
            },
          },
        },
      },
    }

    telescope.load_extension "fzf"
    telescope.load_extension "ui-select"
    telescope.load_extension "media_files"
  end,
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    {
      "s1n7ax/nvim-window-picker",
      version = "2.*",
    },
  },
  config = function()
    require("window-picker").setup {
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        bo = {
          filetype = { "neo-tree", "neo-tree-popup", "notify" },
          buftype = { "terminal", "quickfix" },
        },
      },
    }

    require("neo-tree").setup {
      enable_diagnostics = true,
      default_component_configs = {
        indent = {
          with_markers = true,
          indent_size = 2,
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "󰈚",
        },
        modified = {
          symbol = "●",
        },
        git_status = {
          symbols = {
            added = "",
            modified = "",
            deleted = "",
            renamed = "󰑕",
            untracked = "",
            ignored = "",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        },
      },
      filesystem = {
        components = {
          name = function(config, node, state)
            local result = require("neo-tree.sources.filesystem.components").name(config, node, state)
            if node:get_depth() == 1 and node.type ~= "message" then
              result.text = vim.fn.fnamemodify(node.path, ":t")
            end
            return result
          end,
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
    }

    vim.cmd [[Neotree reveal]]
  end,
}

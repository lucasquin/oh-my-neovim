-- disable netrw on start.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups.
vim.opt.termguicolors = true

-- Enable nvim-tree on start.
vim.cmd([[
  autocmd VimEnter * NvimTreeOpen
]])

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 65,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
      icons = {
        edge = "║ ",
        item = "║ ",
        corner = "╙",
        none = " ",
      }
    },
    icons = {
      show = {
        file = false,
        folder = true,
        folder_arrow = true,
        git = false
      },
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "➜",
          untracked = "",
          deleted = "",
          ignored = "◌",
        }
      }
    }
  },
  filters = {
    dotfiles = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  }
})

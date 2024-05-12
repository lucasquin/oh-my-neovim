return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup {
      options = {
        mode = "buffers",
        numbers = "orginal",
        right_mouse_command = "vert sbuffer %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
          style = "icon",
        },
        name_formatter = function(buf)
          if buf.name:match "%.md" then
            return vim.fn.fnamemodify(buf.name, ":t:r")
          end
        end,
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "neo-tree",
            text = "",
            highlight = "PanelHeading",
            padding = 1,
          },
          {
            filetype = "dapui_scopes",
            text = "",
            highlight = "PanelHeading",
            padding = 1,
          },
          {
            filetype = "dapui_breakpoints",
            text = "",
            highlight = "PanelHeading",
            padding = 1,
          },
          {
            filetype = "dapui_stacks",
            text = "",
            highlight = "PanelHeading",
            padding = 1,
          },
          {
            filetype = "dapui_watches",
            text = "",
            highlight = "PanelHeading",
            padding = 1,
          },
          {
            filetype = "dap-repl",
            text = "",
            highlight = "PanelHeading",
            padding = 1,
          },
          {
            filetype = "dapui_console",
            text = "",
            highlight = "PanelHeading",
            padding = 1,
          },
          {
            filetype = "lazy",
            text = "",
            highlight = "PanelHeading",
            padding = 1,
          },
        },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
      },
    }
  end,
}

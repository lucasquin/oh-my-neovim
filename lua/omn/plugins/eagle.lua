return {
  "soulis-1256/eagle.nvim",
  config = function()
    require("eagle").setup {
      debug_mode = false,

      close_on_cmd = true,
      show_lsp_info = true,
      scrollbar_offset = 0,
      max_width_factor = 2,
      max_height_factor = 2.5,
      render_delay = 1000,
      detect_idle_timer = 50,
      window_row = 0,
      window_col = 5,
      border = "rounded",
      title = "",
      title_pos = "center",
      title_color = "#8AAAE5",
      border_color = "#8AAAE5",
    }
  end,
}

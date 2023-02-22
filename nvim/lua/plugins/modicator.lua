local modicator = require("modicator")

modicator.setup({
  show_warnings = false,
  line_numbers = false,
  cursorline = true,

  highlights = {
    defaults = {
      bold = true,
      italic = false
    },

    modes = {
      ["n"] = {
        foreground = modicator.get_highlight_fg("Question"),
      },
      ["i"] = {
        foreground = modicator.get_highlight_bg("lualine_a_insert"),
      },
      ["v"] = {
        foreground = modicator.get_highlight_bg("lualine_a_visual"),
      },
      ["V"] = {
        foreground = modicator.get_highlight_bg("lualine_a_visual"),
      },
      [""] = { -- This symbol is the ^V character
        foreground = modicator.get_highlight_bg("lualine_a_visual"),
      },
      ["s"] = {
        foreground = modicator.get_highlight_bg("lualine_a_inactive"),
      },
      ["S"] = {
        foreground = modicator.get_highlight_bg("lualine_a_inactive"),
      },
      ["R"] = {
        foreground = modicator.get_highlight_bg("lualine_a_replace"),
      },
      ["c"] = {
        foreground = modicator.get_highlight_bg("lualine_a_command"),
      },
    },
  },
})

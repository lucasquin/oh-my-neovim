local modicator = require('modicator')

modicator.setup({
	show_warnings = false,
	highlights = {
		defaults = {
			bold = false,
			italic = true
		},
		modes = {
			['n'] = {
				foreground = modicator.get_highlight_bg('lualine_a_normal'),
			},
			['i'] = {
				foreground = modicator.get_highlight_bg('lualine_a_insert'),
			},
			['v'] = {
				foreground = modicator.get_highlight_bg('lualine_a_visual'),
			},
			['V'] = {
				foreground = modicator.get_highlight_bg('lualine_a_visual'),
			},
			[''] = {
				foreground = modicator.get_highlight_bg('lualine_a_visual'),
			},
			['s'] = {
				foreground = modicator.get_highlight_bg('lualine_a_inactive'),
			},
			['S'] = {
				foreground = modicator.get_highlight_bg('lualine_a_inactive'),
			},
			['R'] = {
				foreground = modicator.get_highlight_bg('lualine_a_replace'),
			},
			['c'] = {
				foreground = modicator.get_highlight_bg('lualine_a_command'),
			},
		},
	},
})

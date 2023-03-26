local bufferline = require("bufferline")

bufferline.setup({
	options = {
		offsets = {
			{
				filetype = "neo-tree",
				separator = true,
				text = function()
					return vim.fn.getcwd()
				end,
				highlight = "Directory",
				text_align = "left"
			}
		},
		separator_style = { '', '' }
	}
})

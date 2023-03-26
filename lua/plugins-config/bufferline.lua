local bufferline = require("bufferline")

bufferline.setup({
	options = {
		color_icons = true,
		offsets = {
			{
				filetype = "neo-tree",
				separator = true,
			}
		},
		separator_style = { '', '' }
	}
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

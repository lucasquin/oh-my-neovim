local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	definition = {
		keys = {
			edit = "<CR>",
			quit = { "q", "<ESC>" },
		},
	},
	finder = {
		keys = {
			edit = "<CR>",
			quit = { "q", "<ESC>" },
		},
	},
	ui = {
		colors = {
			normal_bg = "#022746",
		},
	},
})

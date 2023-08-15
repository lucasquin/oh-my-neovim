local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
	return
end

lspsaga.setup({
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

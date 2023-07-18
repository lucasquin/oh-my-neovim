local picker_status_ok, picker = pcall(require, "window-picker")
if not picker_status_ok then
	return
end

picker.setup({
	autoselect_one = true,
	include_current = false,
	filter_rules = {
		bo = {
			filetype = { "neo-tree", "neo-tree-popup", "notify" },
			buftype = { "terminal", "quickfix" },
		},
	},
	other_win_hl_color = "#e35e4f",
})

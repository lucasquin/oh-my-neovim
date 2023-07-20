local status_ok, local_highlight = pcall(require, "local-highlight")
if not status_ok then
	return
end

local_highlight.setup({
	disable_file_types = { "neo-tree" },
	hlgroup = "Search",
	cw_hlgroup = nil,
})

local gistsigns_status_ok, gitsigns = pcall(require, "gitsigns")
if not gistsigns_status_ok then
	return
end

gitsigns.setup({
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "▎" },
		topdelete = { text = "契" },
		changedelete = { text = "▎" },
		untracked = { text = "▎" },
	},
})

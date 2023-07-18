local autopairs_status_ok, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status_ok then
	return
end

autopairs.setup({
	disable_filetype = { "TelescopePrompt", "neo-tree" },
})

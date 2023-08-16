local status_ok = pcall(require, "diffview")
if not status_ok then
	return
end

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<CR>", opts)
vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>", opts)

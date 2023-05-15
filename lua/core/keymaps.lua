function Map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Navigate splits with CTRL + hjkl.
Map("", "<C-h>", "<C-w>h")
Map("", "<C-j>", "<C-w>j")
Map("", "<C-k>", "<C-w>k")
Map("", "<C-l>", "<C-w>l")

-- Shift tab default.
Map("i", "<S-Tab>", "<C-d>")

-- Save with CTRL S.
Map("", "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Select all.
Map("n", "<C-a>", "ggVG", { desc = "Select all" })

--
Map("n", "<leader>nh", ":nohl<CR>", { desc = "No search highlight" })

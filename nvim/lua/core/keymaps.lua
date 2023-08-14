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

-- Function for resize buffer
function Resize_buffer(direction)
	if direction == "up" then
		vim.cmd("resize -1")
	elseif direction == "down" then
		vim.cmd("resize +1")
	elseif direction == "left" then
		vim.cmd("vertical resize +2")
	elseif direction == "right" then
		vim.cmd("vertical resize -2")
	end
end

Map("", "<C-Up>", ":lua Resize_buffer('up')<CR>", { noremap = true })
Map("", "<C-Down>", ":lua Resize_buffer('down')<CR>", { noremap = true })
Map("", "<C-Left>", ":lua Resize_buffer('left')<CR>", { noremap = true })
Map("", "<C-Right>", ":lua Resize_buffer('right')<CR>", { noremap = true })

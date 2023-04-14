-- Functional wrapper for mapping custom keybindings.
function Map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Disable arrow keys.
Map('', '<up>', '<nop>')
Map('', '<down>', '<nop>')
Map('', '<left>', '<nop>')
Map('', '<right>', '<nop>')

-- Navigate splits with CTRL + hjkl.
Map('', '<C-h>', '<C-w>h')
Map('', '<C-j>', '<C-w>j')
Map('', '<C-k>', '<C-w>k')
Map('', '<C-l>', '<C-w>l')

-- Shift tab default.
Map('i', '<S-Tab>', '<C-d>')

-- Save with CTRL S.
Map('', '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

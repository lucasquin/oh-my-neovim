local autocmd = vim.api.nvim_create_autocmd

-- Remove whitespaces on save.
autocmd('BufWritePre', {
	pattern = '',
	command = ":%s/\\s\\+$//e"
})

-- Show relative line number in normal mode only.
vim.cmd([[
	augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
	autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
	augroup END
]])

-- Set colorscheme
vim.cmd([[
	autocmd VimEnter * colorscheme dracula-soft
]])

-- Set indentation to 2 spaces.
local autogroup = vim.api.nvim_create_augroup

autogroup('setIndent', {
	clear = true
})

local languages = { 'xml', 'html', 'xhtml', 'css', 'scss', 'sass', 'yaml', 'lua' }

autocmd('Filetype', {
	group = 'setIndent',
	pattern = languages,
	command = 'setlocal shiftwidth=2 tabstop=2 softtabstop=2'
})

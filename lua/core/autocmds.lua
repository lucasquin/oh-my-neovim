local autocmd = vim.api.nvim_create_autocmd

-- Remove whitespaces on save.
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Set indentation to 2 spaces.
local autogroup = vim.api.nvim_create_augroup

autogroup('setIndent', {
	clear = true
})

local languages = { 'xml', 'html', 'xhtml', 'css', 'scss', 'sass', 'yaml', 'lua' }

autocmd('Filetype', {
  group = 'setIndent',
  pattern = languages,
command = 'setlocal shiftwidth=2 tabstop=2'
})


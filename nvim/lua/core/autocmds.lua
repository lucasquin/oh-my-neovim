---------------------------------------------------------------------------------------------------
-- Autocmds config
---------------------------------------------------------------------------------------------------

-- Define autocommands with Lua APIs.
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Remove whitespaces on save.
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Set indentation to 2 spaces.
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'sass', 'yaml', 'lua'
},
command = 'setlocal shiftwidth=2 tabstop=2'
})

-- Show relative line number in normal mode only.
vim.cmd([[
  augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup END
]])

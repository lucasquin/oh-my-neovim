local autocmd = vim.api.nvim_create_autocmd

-- Remove whitespaces on save.
autocmd("BufWritePre", {
	pattern = "",
	command = ":%s/\\s\\+$//e",
})

-- Show relative line number in normal mode only.
vim.cmd([[
	augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
	autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
	augroup END
]])

if vim.fn.has("win32" or "win64") == 1 then
	vim.o.shell = "powershell.exe"
end

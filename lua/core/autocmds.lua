-- Show relative line number in normal mode only.
if not vim.g.neovide then
    vim.cmd([[
        augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
        autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
        augroup END
    ]])
end


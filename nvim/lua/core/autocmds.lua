-- Show relative line number in normal mode only.
vim.cmd([[
    augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    augroup END
]])

-- Highlight paren pair
vim.cmd([[
    autocmd VimEnter * hi MatchParen guifg=#FFFFFF guibg=#FF0000
]])


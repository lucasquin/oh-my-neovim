local autocmd = vim.api.nvim_create_autocmd

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

local has = vim.fn.has
if has("wsl") == 1 then
    vim.cmd([[
        augroup Yank
        autocmd!
        autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
        augroup END
    ]])
end

-- Char default: │
vim.cmd([[
    autocmd VimEnter * set fillchars+=vert:\ 
]])

-- Highlight paren pair
vim.cmd([[
    autocmd VimEnter * hi MatchParen guifg=#FFFFFF guibg=#FF0000
]])

local dracula_status_ok, dracula = pcall(require, "dracula")
if not dracula_status_ok then
	return
end

dracula.setup({
	show_end_of_buffer = false,
	transparent_bg = false,
	lualine_bg_color = nil,
	italic_comment = true,
})

vim.cmd.colorscheme("dracula")


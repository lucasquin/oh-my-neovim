if not vim.g.neovide then
    return
end

local alpha = function()
    return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end

vim.g.neovide_transparency = 0.94
vim.g.transparency = 0.8
vim.g.neovide_background_color = "#202022" .. alpha()
vim.opt.titlestring = "Neovim"
vim.o.guifont = "CaskaydiaCove NFM:h10"
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_scroll_animation_length = 0.3
vim.g.neovide_hide_mouse_when_typing = false
vim.g.neovide_refresh_rate = 60
vim.g.neovide_confirm_quit = true
vim.g.neovide_fullscreen = false
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.opt.number = true
vim.opt.relativenumber = false

vim.cmd([[
  autocmd FileType neotree setlocal guifont=CaskaydiaCove\ NFM:h2
]])


local _, lspsaga = pcall(require, "lspsaga")
if not _ then
    return
end

lspsaga.setup({
    scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
    definition = {
        keys = {
            edit = "<CR>",
            quit = { "q", "<ESC>" },
        },
    },
    finder = {
        keys = {
            edit = "<CR>",
            quit = { "q", "<ESC>" },
        },
    },
    ui = {
        sign = false,
        --colors = {
            --normal_bg = "#022746",
        --},
    },
    symbol_in_winbar = {
        enable = false
    }
})

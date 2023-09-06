local _, styler = pcall(require, "styler")
if not _ then
    return
end

styler.setup({
    themes = {
        cs = { colorscheme = "vscode" },
        lua = { colorscheme = "tokyonight" },
        javascript = { colorscheme = "dracula-soft" },
        typescript = { colorscheme = "dracula-soft" },
    },
})

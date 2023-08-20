local _, autopairs = pcall(require, "nvim-autopairs")
if not _ then
    return
end

autopairs.setup({
    disable_filetype = { "TelescopePrompt", "neo-tree" },
})

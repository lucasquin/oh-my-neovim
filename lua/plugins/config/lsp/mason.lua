local _, mason = pcall(require, "mason")
if not _ then
    return
end

mason.setup()

local _, mason_lspconfig = pcall(require, "mason-lspconfig")
if not _ then
    return
end

mason_lspconfig.setup({
    automatic_installation = true,
})

local _, mason_null_ls = pcall(require, "mason-null-ls")
if not _ then
    return
end

mason_null_ls.setup({
    automatic_installation = true,
    ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d",
    },
})

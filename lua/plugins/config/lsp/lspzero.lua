local ok, lsp = pcall(require, "lsp-zero")
if not ok then
	return
end

lsp.preset("recommended")

lsp.set_preferences({
    sign_icons = { error = " ", warn = " ", hint = "ﴞ ", info = " " }
})

local sources = lsp.defaults.cmp_sources()

table.insert(sources, { name = "nvim_lsp_signature_help" })

local opts = { noremap = true, silent = true}
vim.keymap.set("n", "<F12>", "<cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "<C-F12>", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.keymap.set("n", "<S-F12>", "<cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "<C-S-F12>", "<cmd>Lspsaga finder<CR>", opts)
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
vim.keymap.set("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", {})

lsp.setup_nvim_cmp({
    sources = sources,
})

lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

lsp.setup()

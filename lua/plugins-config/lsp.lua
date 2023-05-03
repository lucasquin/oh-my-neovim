local servers = { 'lua_ls', 'tsserver', 'cssls', 'html', 'angularls', 'jsonls' }

require('mason-lspconfig').setup({
	ensure_installed = servers
})

local on_attach = function(client)
	client.server_capabilities.semanticTokensProvider = nil -- Disable LSP syntax highlight.
	local Map = vim.keymap.set
	Map('n', '<leader>rn', vim.lsp.buf.rename, {})
	Map('n', '<space>f', function() vim.lsp.buf.format { async = true } end, {})
	Map('n', '<F2>', require('telescope.builtin').lsp_definitions, {})
	Map('n', '<C-F2>', require('telescope.builtin').lsp_references, {})
	Map('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

for _, lsp in ipairs(servers) do
	require("lspconfig")[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim', 'luasnip' }
				}
			}
		}
	}
end

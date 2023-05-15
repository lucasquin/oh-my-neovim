require("mason").setup()

require("mason-lspconfig").setup({
	automatic_installation = true,
})

require("mason-null-ls").setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
	},
})

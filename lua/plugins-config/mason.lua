local mason = require('mason')

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

local lspconfig = require('mason-lspconfig')

lspconfig.setup({
	automatic_installation = true
})

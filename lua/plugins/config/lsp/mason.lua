local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	return
end

mason.setup()

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

mason_lspconfig.setup({
	automatic_installation = true,
})

local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status_ok then
	return
end

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"sql_formatter",
		"eslint_d",
	},
})

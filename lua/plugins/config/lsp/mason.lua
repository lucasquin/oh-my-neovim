local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	return
end

mason.setup()

local mason_lsp_config_status, mason_lsp_config = pcall(require, "mason-lspconfig")
if not mason_lsp_config_status then
	return
end

mason_lsp_config.setup({
	automatic_installation = true,
})

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls then
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

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	client.server_capabilities.semanticTokensProvider = nil
	client.server_capabilities.documentFormattingProvider = false
	vim.keymap.set("n", "<F12>", "<cmd>Lspsaga peek_definition<CR>", opts) -- go to implementation
	vim.keymap.set("n", "<C-F12>", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	vim.keymap.set("n", "<S-F12>", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	vim.keymap.set("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", {}) -- format
end

local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
	filetypes = { "lua" },
})

lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

lspconfig["angularls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html" },
})

lspconfig["clangd"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["jsonls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "json" },
})

lspconfig["sqlls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "sql" },
})

typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

lspconfig["omnisharp"].setup({
	capabilities = capabilities,
	enable_roslyn_analyzers = true,
	organize_imports_on_format = true,
	enable_import_completion = true,
	analyze_open_documents_only = true,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		client.server_capabilities.semanticTokensProvider.legend = {
			tokenModifiers = { "static" },
			tokenTypes = {
				"comment",
				"excluded_code",
				"identifier",
				"keyword",
				"keyword_control",
				"number",
				"operator",
				"operator_overloaded",
				"preprocessor_keyword",
				"string",
				"whitespace",
				"text",
				"static_symbol",
				"preprocessor_text",
				"punctuation",
				"string_verbatim",
				"string_escape_character",
				"class_name",
				"delegate_name",
				"enum_name",
				"interface_name",
				"module_name",
				"struct_name",
				"type_parameter_name",
				"field_name",
				"enum_member_name",
				"constant_name",
				"local_name",
				"parameter_name",
				"method_name",
				"extension_method_name",
				"property_name",
				"event_name",
				"namespace_name",
				"label_name",
				"xml_doc_comment_attribute_name",
				"xml_doc_comment_attribute_quotes",
				"xml_doc_comment_attribute_value",
				"xml_doc_comment_cdata_section",
				"xml_doc_comment_comment",
				"xml_doc_comment_delimiter",
				"xml_doc_comment_entity_reference",
				"xml_doc_comment_name",
				"xml_doc_comment_processing_instruction",
				"xml_doc_comment_text",
				"xml_literal_attribute_name",
				"xml_literal_attribute_quotes",
				"xml_literal_attribute_value",
				"xml_literal_cdata_section",
				"xml_literal_comment",
				"xml_literal_delimiter",
				"xml_literal_embedded_expression",
				"xml_literal_entity_reference",
				"xml_literal_name",
				"xml_literal_processing_instruction",
				"xml_literal_text",
				"regex_comment",
				"regex_character_class",
				"regex_anchor",
				"regex_quantifier",
				"regex_grouping",
				"regex_alternation",
				"regex_text",
				"regex_self_escaped_character",
				"regex_other_escape",
			},
			range = true,
		}
	end,
})

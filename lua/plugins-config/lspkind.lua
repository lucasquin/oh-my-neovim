local lspkind = require('lspkind')

lspkind.init({
	mode = "symbol",
	symbol_map = {
		Array = "",
		Boolean = "⊨",
		Class = "",
		Constructor = "",
		Key = "",
		Namespace = "",
		Null = "NULL",
		Number = "#",
		Object = "",
		Package = "",
		Property = "",
		Reference = "",
		Snippet = "",
		String = "",
		TypeParameter = "",
		Unit = "",
	},
})

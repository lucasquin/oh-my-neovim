local null_ls = require('null-ls')

null_ls.setup({
	automatic_setup = true,
	sources = {
		null_ls.builtins.formatting.prettier,
	}
})

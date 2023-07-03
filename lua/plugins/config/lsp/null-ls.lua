local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
null_ls.setup({
	debug = true,
	sources = {
		formatting.prettier,
		formatting.stylua,
		formatting.sql_formatter,
		formatting.csharpier,
		diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js")
			end,
		}),
	},
})

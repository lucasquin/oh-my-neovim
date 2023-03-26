local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	highlight = {
		enable = true,
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
	incremental_selection = { enable = true },
	indent = { enable = true },
	autotag = {
		enable = true,
		filetypes = {
			'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue',
			'tsx', 'jsx', 'rescript', 'xml', 'php', 'markdown', 'glimmer', 'handlebars', 'hbs'
		}
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false
	}
})

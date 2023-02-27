local languages = { 'c', 'cpp', 'css', 'javascript', 'json', 'lua', 'typescript', 'vim' }

require 'nvim-treesitter.configs'.setup {
	ensure_installed = languages,
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		disable = function(_, buf)
			local max_filesize = 60 * 1024 -- 60Kb.
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	}
}

local languages = { 'c', 'cpp', 'css', 'scss', 'javascript', 'json', 'lua', 'typescript', 'vim' }

require 'nvim-treesitter.configs'.setup {
	ensure_installed = languages,
	sync_install = false,
	auto_install = true,
	ignore_install = { 'html' },
	highlight = {
		enable = true,
		disable = { 'html' },
		additional_vim_regex_highlighting = false,
	}
}

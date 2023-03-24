local autotags = require('nvim-ts-autotag')

autotags.setup({
	filetypes = {
		'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
		'xml',
		'php',
		'markdown',
		'glimmer', 'handlebars', 'hbs'
	}
})

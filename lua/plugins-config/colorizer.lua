local colorizer = require('colorizer')

colorizer.setup(
	{
		'sass',
		'scss',
		'css',
		'javascript',
		'typescript',
		'lua',
		html = {
			mode = 'background'
		},
	},
	{
		mode = 'foreground'

	}
)

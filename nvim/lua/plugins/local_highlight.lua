local local_highlight = require('local-highlight')

local_highlight.setup({
		hlgroup = 'Search',
		cw_hlgroup = nil,
})

vim.api.nvim_create_autocmd('BufRead', {
  pattern = {'*.*'},
  callback = function(data)
    local_highlight.attach(data.buf)
  end
})


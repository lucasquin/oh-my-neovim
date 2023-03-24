local telescope = require('telescope.builtin')

local Map = vim.keymap.set

Map('n', '<leader>ff', telescope.find_files)
Map('n', '<leader>fb', telescope.buffers)
Map('n', '<leader>fg', telescope.live_grep)

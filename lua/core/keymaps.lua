-- Leader key
vim.g.mapleader = " " -- space

-- Function for create maps
function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Function for resize buffer
function Resize_buffer(direction)
    if direction == "up" then
        vim.cmd("resize -1")
    elseif direction == "down" then
        vim.cmd("resize +1")
    elseif direction == "left" then
        vim.cmd("vertical resize +1")
    elseif direction == "right" then
        vim.cmd("vertical resize -1")
    end
end

-- Navigate splits with CTRL + hjkl.
Map("n", "<C-h>", "<C-w>h", { desc = "Left buffer" })
Map("n", "<C-l>", "<C-w>l", { desc = "Right buffer" })
Map("n", "<C-k>", "<C-w>k", { desc = "Up buffer" })
Map("n", "<C-j>", "<C-w>j", { desc = "Down buffer" })

-- Shift tab default.
Map("i", "<S-Tab>", "<C-d>", { desc = "Back tab" })

-- Save with CTRL S.
Map("n", "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Select all.
Map("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Disable search highlight
Map("n", "<leader>nh", ":nohl<CR>", { desc = "No search highlight" })

-- Resize buffer
Map("n", "<C-Up>", ":lua Resize_buffer('up')<CR>", { desc = "Resize buffer to up" })
Map("n", "<C-Down>", ":lua Resize_buffer('down')<CR>", { desc = "Resize buffer to down" })
Map("n", "<C-Left>", ":lua Resize_buffer('left')<CR>", { desc = "Resize buffer to left" })
Map("n", "<C-Right>", ":lua Resize_buffer('right')<CR>", { desc = "Resize buffer to right" })

-- Move line
Map("n", "<A-k>", ":MoveLine(-1)<CR>", { desc = "Move to up" })
Map("n", "<A-j>", ":MoveLine(1)<CR>", { desc = "Move to down" })
Map("n", "<A-h>", ":MoveHChar(-1)<CR>", { desc = "Move to left" })
Map("n", "<A-l>", ":MoveHChar(1)<CR>", { desc = "Move to right" })
Map("v", "<A-h>", ":MoveHBlock(-1)<CR>", { desc = "Move selection to up" })
Map("v", "<A-j>", ":MoveBlock(1)<CR>", { desc = "Move selection to down" })
Map("v", "<A-k>", ":MoveBlock(-1)<CR>", { desc = "Move selection to left" })
Map("v", "<A-l>", ":MoveHBlock(1)<CR>", { desc = "Move selection to right" })

-- Telescope
Map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
Map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
Map("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "Find in buffer" })
Map("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find help" })

-- Open Neotree
Map("n", "<F2>", ":Neotree toggle<CR>", { desc = "Toggle Neotree" })

-- Open Terminal
Map("n", "<C-t>", ":ToggleTerm<CR>", { desc = "Toggle terminal" })

-- Terminal key to navigate and set Normal mode
Map('t', '<esc>', [[<C-\><C-n>]])
Map('t', 'jk', [[<C-\><C-n>]])
Map('t', '<C-h>', [[:wincmd h<CR>]])
Map('t', '<C-j>', [[:wincmd j<CR>]])
Map('t', '<C-k>', [[:wincmd k<CR>]])
Map('t', '<C-l>', [[:wincmd l<CR>]])
Map('t', '<C-w>', [[<C-\><C-n><C-w>]])

-- Diff view
Map("n", "<leader>do", "<cmd>DiffviewOpen<CR>", { desc = "Git diff view open" })
Map("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "Git diff view close" })

-- LSP
Map("n", "<F12>", ":Lspsaga peek_definition<CR>", { desc = "Peek definition" })
Map("n", "<C-F12>", ":lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation" })
Map("n", "<S-F12>", ":Lspsaga hover_doc<CR>", { desc = "View hover doc" })
Map("n", "<C-S-F12>", ":Lspsaga finder<CR>", { desc = "Find references" })
Map("n", "<leader>ca", ":Lspsaga code_action<CR>", { desc = "View code actions" })
Map("n", "<leader>rn", ":Lspsaga rename<CR>", { desc = "Rename" })
Map("n", "<leader>fm", ":lua vim.lsp.buf.format({ async = true })<CR>", { desc = "Format" })

-- Code folding
Map('n', 'zr', ":lua require('ufo').openAllFolds()<CR>")
Map('n', 'zm', ":lua require('ufo').closeAllFolds()<CR>")

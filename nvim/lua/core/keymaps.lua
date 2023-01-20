-- Functional wrapper for mapping custom keybindings.
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Disable arrow keys.
map('', '<up>', '<nop>')
map('', '<down>', '<nop>') 
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Navigate splits with CTRL + hjkl.
map('', '<C-h>', '<C-w>h')
map('', '<C-j>', '<C-w>j')
map('', '<C-k>', '<C-w>k')
map('', '<C-l>', '<C-w>l')

-- Shift tab default.
map('i', '<S-Tab>', '<C-d>')
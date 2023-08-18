local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
    return
end

local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
}

for option, value in pairs(powershell_options) do
    vim.opt[option] = value
end

toggleterm.setup({
    autochdir = true,
    shade_terminals = true,
    auto_scroll = true,
    shade_filetypes = { "neo-tree", "fzf" },
    persist_size = false
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-t>", "<cmd>Neotree toggle<CR><cmd>ToggleTerm<CR><cmd>Neotree<CR>", opts)

local opt = { buffer = 0 }
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opt)
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opt)
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opt)
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opt)
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opt)
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opt)
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opt)

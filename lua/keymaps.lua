local map = vim.keymap.set

-- Neotree
map("n", "<C-n>", "<cmd>Neotree toggle<CR>", { desc = "Neotree toggle window" })

-- Comment
map("n", "gcc", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "gc", "gc", { desc = "Toggle comment", remap = true })

-- Gitsign
map("n", "[g", '<cmd>lua require"gitsigns".next_hunk()<CR>', { desc = "" })
map("n", "]g", '<cmd>lua require"gitsigns".prev_hunk()<CR>', { desc = "" })

-- Telescope
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>ff", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "telescope find all files" })
map("n", "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })

-- Lspsaga
map("n", "<F12>", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek definition" })
map("n", "<S-F12>", "<cmd>Lspsaga hover_doc<CR>", { desc = "Show documentation for the symbol under the cursor" })
map("n", "<C-F12>", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek definition" })
map("n", "<C-S-F12>", "<cmd>Lspsaga finder<CR>", { desc = "" })
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "" })
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "" })
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Execute code actions on the current line(s)" })
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename the symbol under the cursor" })
map("n", "gp", "<cmd>Lspsaga goto_definition<CR>", { desc = "Jump to definition" })
map("n", "<leader>dw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", { desc = "" })
map("n", "<leader>db", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "" })

-- General
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })
map("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize window up" })
map("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize window down" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize window left" })
map("n", "<C-Right>", "<cmd>vertical resize -2<CR>", { desc = "Resize window right" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to window on the left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to window on the right" })
map("n", "<C-a>", "ggVG", { desc = "Select all text" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save the current file" })
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "Create a new buffer" })
map("i", "<S-Tab>", "<C-d>", { desc = "Move one indentation level back" })

-- Conform
map("n", "<leader>fm", function()
  require("conform").format {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  }
end, { desc = "Format the current buffer" })

map("v", "<leader>fb", function()
  require("conform").format {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  }
end, { desc = "Range format the current visual selection" })

-- DAP
map("n", "<F5>", function()
  require("dap").continue()
end, { desc = "telescope find in current buffer" })

map("n", "<S-F5>", function()
  require("dap").terminate()
end, { desc = "Terminate the debugging session" })

map("n", "<F9>", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle a breakpoint at the current line" })

map("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Step over the next line" })

map("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Step into the next function call" })

map("n", "<S-F11>", function()
  require("dap").step_out()
end, { desc = "Step out of the current function" })

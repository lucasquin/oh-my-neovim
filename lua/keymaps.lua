-- Initialize keymap function
local map = vim.keymap.set

-- Normal mode mappings
-- Neotree
map("n", "<C-n>", "<cmd>Neotree toggle<CR>", { desc = "Neotree toggle window" })

-- Comment
map("n", "gcc", "gcc", { desc = "Toggle Comment", remap = true })

map("n", "<leader>e", function()
  vim.diagnostic.open_float { focusable = true }
end, { desc = "Expand an Error into a float" })

-- Gitsigns
map("n", "]g", '<cmd>lua require"gitsigns".next_hunk()<CR>', { desc = "Next git hunk" })
map("n", "[g", '<cmd>lua require"gitsigns".prev_hunk()<CR>', { desc = "Previous git hunk" })

-- Telescope
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "Telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope find oldfiles" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "Telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Telescope git status" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })
map("n", "<leader>ff", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "Telescope find all files" })
map("n", "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope find in current buffer" })

-- LSP
map("n", "<Leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<Leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "<Leader>gh", "<cmd>Lspsaga finder ref<CR>", { desc = "Show references" })
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Show hover information" })
map("n", "<Leader>gs", "<cmd>Lspsaga signature_help<CR>", { desc = "Show signature help" })
map("i", "<C-k>", "<cmd>Lspsaga signature_help<CR>", { desc = "Show signature help in insert mode" })
map("n", "<Leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename symbol" })
map("n", "<Leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Show code actions" })
map("v", "<Leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Show code actions for selection" })

-- General
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })
map("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize window up" })
map("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize window down" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize window left" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize window right" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to window on the left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to window on the right" })
map("n", "<C-a>", "ggVG", { desc = "Select all text" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save the current file" })
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "Create a new buffer" })

-- Conform
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true, async = false, timeout_ms = 1000 }
end, { desc = "Format the current buffer" })

-- DAP
map("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Continue debugging" })

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

-- Visual mode mappings
map("v", "gc", "gc", { desc = "Toggle comment", remap = true })
map("v", "<leader>fm", function()
  require("conform").format { lsp_fallback = true, async = false, timeout_ms = 1000 }
end, { desc = "Range format the current visual selection" })

-- Insert mode mappings
map("i", "<S-Tab>", "<C-d>", { desc = "Move one indentation level back" })

map("n", "<leader>tt", function()
  require("neotest").watch.toggle(vim.fn.expand "%")
end, { desc = "Toggle watch mode" })

map("n", "<leader>ta", function()
  require("neotest").watch.toggle(vim.fn.getcwd())
end, { desc = "Toggle watch all tests" })

-- Neotest keymaps
map("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })

map("n", "<leader>td", function()
  require("neotest").run.run { strategy = "dap" }
end, { desc = "Debug nearest test" })

map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Run tests in current file" })

map("n", "<leader>ta", function()
  require("neotest").run.run(vim.fn.getcwd())
end, { desc = "Run all tests" })

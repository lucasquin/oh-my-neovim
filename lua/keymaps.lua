local map = vim.keymap.set

local function map_keys(mode, keys)
  for lhs, rhs in pairs(keys) do
    local opts = rhs[2] or {}
    opts.desc = opts.desc or ""
    map(mode, lhs, rhs[1], opts)
  end
end

-- Normal mode mappings
local normal_maps = {
  -- Neotree
  ["<C-n>"] = { "<cmd>Neotree toggle<CR>", { desc = "Neotree toggle window" } },

  -- Comment
  ["gcc"] = { "gcc", { desc = "Toggle Comment", remap = true } },

  -- Gitsigns
  ["]g"] = { '<cmd>lua require"gitsigns".next_hunk()<CR>', { desc = "Next git hunk" } },
  ["[g"] = { '<cmd>lua require"gitsigns".prev_hunk()<CR>', { desc = "Previous git hunk" } },

  -- Telescope
  ["<leader>fh"] = { "<cmd>Telescope help_tags<CR>", { desc = "Telescope help page" } },
  ["<leader>ma"] = { "<cmd>Telescope marks<CR>", { desc = "Telescope find marks" } },
  ["<leader>fo"] = { "<cmd>Telescope oldfiles<CR>", { desc = "Telescope find oldfiles" } },
  ["<leader>cm"] = { "<cmd>Telescope git_commits<CR>", { desc = "Telescope git commits" } },
  ["<leader>gt"] = { "<cmd>Telescope git_status<CR>", { desc = "Telescope git status" } },
  ["<leader>fg"] = { "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" } },
  ["<leader>ff"] = { "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "Telescope find all files" } },
  ["<leader>fb"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope find in current buffer" } },

  -- Lspsaga
  ["[d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Jump to next diagnostic" } },
  ["]d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Jump to previous diagnostic" } },
  ["K"] = { "<cmd>Lspsaga hover_doc<CR>", { desc = "Show hover documentation" } },
  ["ca"] = { "<cmd>Lspsaga code_action<CR>", { desc = "Show code actions" } },
  ["rn"] = { "<cmd>Lspsaga rename<CR>", { desc = "Rename symbol" } },
  ["gd"] = { "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek definition" } },
  ["gp"] = { "<cmd>Lspsaga goto_definition<CR>", { desc = "Go to definition" } },
  ["gh"] = { "<cmd>Lspsaga finder<CR>", { desc = "Show reference finder" } },
  ["<Leader>o"] = { "<cmd>Lspsaga outline<CR>", { desc = "Show document outline" } },
  ["<Leader>dw"] = { "<cmd>Lspsaga show_workspace_diagnostics<CR>", { desc = "Show workspace diagnostics" } },
  ["<Leader>db"] = { "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "Show buffer diagnostics" } },

  -- General
  ["<Esc>"] = { "<cmd>noh<CR>", { desc = "Clear highlights" } },
  ["<C-Up>"] = { "<cmd>resize -2<CR>", { desc = "Resize window up" } },
  ["<C-Down>"] = { "<cmd>resize +2<CR>", { desc = "Resize window down" } },
  ["<C-Left>"] = { "<cmd>vertical resize -2<CR>", { desc = "Resize window left" } },
  ["<C-Right>"] = { "<cmd>vertical resize +2<CR>", { desc = "Resize window right" } },
  ["<C-h>"] = { "<C-w>h", { desc = "Move to window on the left" } },
  ["<C-j>"] = { "<C-w>j", { desc = "Move to window below" } },
  ["<C-k>"] = { "<C-w>k", { desc = "Move to window above" } },
  ["<C-l>"] = { "<C-w>l", { desc = "Move to window on the right" } },
  ["<C-a>"] = { "ggVG", { desc = "Select all text" } },
  ["<C-s>"] = { "<cmd>w<CR>", { desc = "Save the current file" } },
  ["<leader>b"] = { "<cmd>enew<CR>", { desc = "Create a new buffer" } },

  -- Conform
  ["<leader>fm"] = {
    function()
      require("conform").format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end,
    { desc = "Format the current buffer" },
  },

  -- DAP
  ["<F5>"] = {
    function()
      require("dap").continue()
    end,
    { desc = "Continue debugging" },
  },
  ["<S-F5>"] = {
    function()
      require("dap").terminate()
    end,
    { desc = "Terminate the debugging session" },
  },
  ["<F9>"] = {
    function()
      require("dap").toggle_breakpoint()
    end,
    { desc = "Toggle a breakpoint at the current line" },
  },
  ["<F10>"] = {
    function()
      require("dap").step_over()
    end,
    { desc = "Step over the next line" },
  },
  ["<F11>"] = {
    function()
      require("dap").step_into()
    end,
    { desc = "Step into the next function call" },
  },
  ["<S-F11>"] = {
    function()
      require("dap").step_out()
    end,
    { desc = "Step out of the current function" },
  },
}

-- Visual mode mappings
local visual_maps = {
  ["gc"] = { "gc", { desc = "Toggle comment", remap = true } },
  ["<leader>fb"] = {
    function()
      require("conform").format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end,
    { desc = "Range format the current visual selection" },
  },
}

-- Insert mode mappings
local insert_maps = {
  ["<S-Tab>"] = { "<C-d>", { desc = "Move one indentation level back" } },
}

-- Apply all mappings
map_keys("n", normal_maps)
map_keys("v", visual_maps)
map_keys("i", insert_maps)

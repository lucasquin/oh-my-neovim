---@diagnostic disable: different-requires

local maps = {
  Neovim = {
    n = {
      ["<Esc>"] = { "<cmd>noh<CR>", "Clear highlights" },
      ["<C-Up>"] = { "<cmd>resize -2<CR>", "Resize window up" },
      ["<C-Down>"] = { "<cmd>resize +2<CR>", "Resize window down" },
      ["<C-Left>"] = { "<cmd>vertical resize -2<CR>", "Resize window left" },
      ["<C-Right>"] = { "<cmd>vertical resize -2<CR>", "Resize window right" },
      ["<C-h>"] = { "<C-w>h", "Move to window on the left" },
      ["<C-j>"] = { "<C-w>j", "Move to window below" },
      ["<C-k>"] = { "<C-w>k", "Move to window above" },
      ["<C-l>"] = { "<C-w>l", "Move to window on the right" },
      ["<C-a>"] = { "ggVG", "Select all text" },
      ["<C-s>"] = { "<cmd>w<CR>", "Save the current file" },
      ["<leader>b"] = { "<cmd>enew<CR>", "Create a new buffer" },
    },
    i = {
      ["<C-h>"] = { "<Left>", "Move cursor one character left" },
      ["<C-j>"] = { "<Down>", "Move cursor one line down" },
      ["<C-k>"] = { "<Up>", "Move cursor one line up" },
      ["<C-l>"] = { "<Right>", "Move cursor one character right" },
      ["<S-Tab>"] = { "<C-d>", "Move one indentation level back" },
    },
  },
  Conform = {
    n = {
      ["<leader>fm"] = {
        function()
          require("conform").format { lsp_fallback = true, async = false, timeout_ms = 1000 }
        end,
        "Format the current buffer",
      },
    },
    v = {
      ["<leader>fm"] = {
        function()
          require("conform").format { lsp_fallback = true, async = false, timeout_ms = 1000 }
        end,
        "Range format the current visual selection ",
      },
    },
  },
  DAP = {
    n = {
      ["<F5>"] = {
        function()
          require("dap").continue()
        end,
        "Continue program execution (if paused)",
      },
      ["<S-F5>"] = {
        function()
          require("dap").terminate()
        end,
        "Terminate the debugging session",
      },
      ["<F9>"] = {
        function()
          require("dap").toggle_breakpoint()
        end,
        "Toggle a breakpoint at the current line",
      },
      ["<F10>"] = {
        function()
          require("dap").step_over()
        end,
        "Step over the next line",
      },
      ["<F11>"] = {
        function()
          require("dap").step_into()
        end,
        "Step into the next function call",
      },
      ["<S-F11>"] = {
        function()
          require("dap").step_out()
        end,
        "Step out of the current function",
      },
    },
  },
  Telescope = {
    n = {
      ["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Search for files" },
      ["<leader>fg"] = { "<cmd>Telescope live_grep<CR>", "Search text within files" },
      ["<leader>fb"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Fuzzy search within the current buffer" },
      ["<leader>fh"] = { "<cmd>Telescope help_tags<CR>", "Search help topics" },
    },
  },
  Neotree = {
    n = {
      ["<C-n>"] = { "<cmd>Neotree toggle<CR>", "Toggle the 'NvimTree' file explorer sidebar" },
    },
  },
  LSP = {
    n = {
      ["<F12>"] = { vim.lsp.buf.definition, "Jump to the definition of the symbol under the cursor" },
      ["<C-F12>"] = { vim.lsp.buf.declaration, "Jump to the definition of the symbol under the cursor" },
      ["<C-S-F12>"] = { vim.lsp.buf.implementation, "Jump to the implementation of the symbol under the cursor" },
      ["<S-F12>"] = { vim.lsp.buf.signature_help, "Show documentation for the symbol under the cursor" },
      ["<leader>rn"] = { vim.lsp.buf.rename, "Rename the symbol under the cursor" },
      ["<leader>ca"] = { vim.lsp.buf.code_action, "Execute code actions on the current line(s)" },
    },
  },
}

local map = vim.keymap.set

for _, plugins in pairs(maps) do
  for mode, keybindings in pairs(plugins) do
    for keybinding, mapping in pairs(keybindings) do
      map(mode, keybinding, mapping[1], { desc = mapping[2] })
    end
  end
end

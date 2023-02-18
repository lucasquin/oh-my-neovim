require("mason").setup()

-- Add servers here.
local servers = {
  "lua_ls",
  "clangd",
  "cssls",
  "html",
  "jsonls",
  "tsserver",
  "sqlls",
  "angularls"
}

require("mason-lspconfig").setup {
  ensure_installed = servers
}

local on_attach = function(client, bufnr)
  -- Disable LSP syntax highlight.
  client.server_capabilities.semanticTokensProvider = nil

  -- Mapping keys.
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, {})

  vim.keymap.set('n', '<F2>', vim.lsp.buf.definition, {})
  vim.keymap.set('n', '<C-F2>', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

-- Customizing how diagnostics are displayed.
vim.diagnostic.config({
  update_in_insert = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- Show line diagnostics automatically in hover window.
vim.cmd([[
  autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
]])

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local root_dir = function()
  return vim.fn.getcwd()
end

-- Call setup.
for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup {
    on_attach = on_attach,
    root_dir = root_dir,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim', 'luasnip' }
        }
      }
    }
  }
end

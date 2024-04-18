return {
  "williamboman/mason.nvim",
  dependencies = {
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      dependencies = { "williamboman/mason-lspconfig.nvim" },
    },
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup {}
    require("mason-tool-installer").setup {
      ensure_installed = {
        -- LSP
        "lua_ls",
        "svelte",
        "cssls",
        "html",
        "jsonls",
        "cmake",
        "cssmodules_ls",
        "clangd",
        "gopls",
        "templ",
        "bashls",
        "marksman",
        "yamlls",
        "dockerls",
        "docker_compose_language_service",
        "ltex",
        "tailwindcss",
        "vimls",
        "tsserver",
        "robotframework_ls",
        "pylsp",

        -- Linters
        "golangci-lint",
        "markdownlint",
        "eslint",
        "jsonlint",

        -- Formatters
        "prettierd",
        "stylua",
        "gofumpt",
        "goimports",
        "shfmt",

        -- Debug Adapters
        "delve",
      },
      auto_update = false,
      run_on_start = true,
    }
  end,
}

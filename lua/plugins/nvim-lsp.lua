return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require "lspconfig"
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities.textDocument.completion.completionItem = {
      documentationFormat = { "markdown", "plaintext" },
      snippetSupport = true,
      preselectSupport = true,
      insertReplaceSupport = true,
      labelDetailsSupport = true,
      deprecatedSupport = true,
      commitCharactersSupport = true,
      tagSupport = { valueSet = { 1 } },
      resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      },
    }

    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    -- Common setup for simple LSP servers
    local simple_servers = {
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
      "tailwindcss",
      "vimls",
      "tsserver",
      "cssls",
      "html",
      "jsonls",
      "phpactor",
    }

    for _, server in ipairs(simple_servers) do
      lspconfig[server].setup {
        capabilities = capabilities,
      }
    end

    -- Robot Framework
    lspconfig.robotframework_ls.setup {
      config = {
        filetypes = { "robot", "resource" },
      },
      settings = {
        robot = {
          python = {
            executable = "/usr/bin/python3",
          },
          lint = {
            undefinedLibraries = true,
            robocop = {
              enabled = true,
            },
          },
        },
      },
    }

    -- Svelte
    lspconfig.svelte.setup {
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern("svelte.config.cjs", "svelte.config.js"),
      settings = {
        svelte = {
          plugin = {
            typescript = {
              diagnostics = { enable = true },
            },
            svelte = {
              diagnostics = { enable = true },
              defaultScriptLanguage = "ts",
            },
          },
        },
      },
    }

    -- LTeX
    lspconfig.ltex.setup {
      capabilities = capabilities,
      settings = {
        ltex = {
          language = { "en-US" },
          enabled = {
            "bibtex",
            "gitcommit",
            "markdown",
            "org",
            "tex",
            "restructuredtext",
            "rsweave",
            "latex",
            "quarto",
            "rmd",
            "context",
          },
        },
      },
    }

    -- Lua
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    }

    -- Python
    lspconfig.pylsp.setup {
      capabilities = capabilities,
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = { "W391" },
              maxLineLength = 140,
            },
          },
        },
      },
    }
  end,
}

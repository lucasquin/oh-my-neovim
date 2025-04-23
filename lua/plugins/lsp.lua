return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig", "Hoffs/omnisharp-extended-lsp.nvim" },
  config = function()
    -- Setup Mason
    require("mason").setup {
      max_concurrent_installers = 10,
      ui = {
        icons = {
          package_pending = " ",
          package_installed = " ",
          package_uninstalled = " ",
        },
      },
    }

    -- Setup Mason LSP Config
    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls", "marksman" },
      automatic_installation = true,
    }

    -- LSP Config
    local lspconfig = require "lspconfig"
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Define diagnostic signs
    vim.diagnostic.config {
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
    }

    -- Function to setup LSP servers with common settings
    local function setup_server(server, config)
      local ok, err = pcall(function()
        lspconfig[server].setup(vim.tbl_extend("force", {
          capabilities = capabilities,
        }, config or {}))
      end)
      if not ok then
        vim.notify("Failed to setup " .. server .. ": " .. err, vim.log.levels.ERROR)
      end
    end

    -- List of simple servers that don't require additional configuration
    local simple_servers = {
      "cmake",
      "cssmodules_ls",
      "gopls",
      "templ",
      "bashls",
      "marksman",
      "yamlls",
      "dockerls",
      "docker_compose_language_service",
      "tailwindcss",
      "vimls",
      "ts_ls",
      "html",
      "jsonls",
      "phpactor",
      "pbls",
    }

    -- Setup simple servers
    for _, server in ipairs(simple_servers) do
      setup_server(server)
    end

    -- Lua
    setup_server("lua_ls", {
      on_init = function(client, _)
        if client.supports_method "textDocument/semanticTokens" then
          client.server_capabilities.semanticTokensProvider = nil
        end
      end,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              vim.fn.expand "$VIMRUNTIME/lua",
              vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
              vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
              "${3rd}/luv/library",
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    })

    -- Svelte
    setup_server("svelte", {
      filetypes = { "svelte" },
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
    })

    -- Robot Framework
    setup_server("robotframework_ls", {
      filetypes = { "robot", "resource" },
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
    })

    -- LTeX
    setup_server("ltex", {
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
    })

    -- Python
    setup_server("pylsp", {
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              maxLineLength = 120,
            },
          },
        },
      },
    })

    -- CSS
    setup_server("cssls", {
      filetypes = { "css", "scss", "sass" },
    })

    -- C / C++
    setup_server("clangd", {
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    })

    -- Angular
    setup_server("angularls", {
      root_dir = lspconfig.util.root_pattern("angular.json", "nx.json", "package.json"),
    })

    -- C#
    setup_server("omnisharp", {
      cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
      handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").definition_handler,
        ["textDocument/references"] = require("omnisharp_extended").references_handler,
        ["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
        ["textDocument/hover"] = function(_, result, ctx, config)
          if result == nil then
            vim.notify("No information available", vim.log.levels.INFO)
            return
          end

          vim.lsp.handlers["textDocument/hover"](nil, result, ctx, config)
        end,
      },
      filetypes = { "cs", "csproj", "sln" },
      settings = {
        FormattingOptions = {
          EnableEditorConfigSupport = true,
          OrganizeImports = true,
        },
        MsBuild = {
          LoadProjectsOnDemand = nil,
        },
        RoslynExtensionsOptions = {
          EnableAnalyzersSupport = nil,
          EnableImportCompletion = true,
          AnalyzeOpenDocumentsOnly = nil,
          EnableDecompilationSupport = true,
        },
        Sdk = {
          IncludePrereleases = true,
        },
      },
    })
  end,
}

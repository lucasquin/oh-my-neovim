return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
      max_concurrent_installers = 10,
      ui = {
        icons = {
          package_pending = " ",
          package_installed = " ",
          package_uninstalled = " ",
        },
      },
    }

    require("mason-lspconfig").setup {}

    require("mason-tool-installer").setup {
      ensure_installed = {
        -- Lua
        {
          "lua-language-server",
          condition = function()
            return vim.fn.executable "lua" == 1
          end,
        },

        -- Go
        {
          "gopls",
          condition = function()
            return vim.fn.executable "go" == 1
          end,
        },

        -- CSS Modules
        {
          "cssmodules-language-server",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },

        -- Markdown
        {
          "marksman",
          condition = function()
            return true -- Self-contained, no dependencies
          end,
        },

        -- CMake
        {
          "cmake-language-server",
          condition = function()
            return vim.fn.executable "cmake" == 1 and vim.fn.executable "pip3" == 1
          end,
        },

        -- Templ (Go templating)
        {
          "templ",
          condition = function()
            return vim.fn.executable "go" == 1
          end,
        },

        -- Bash
        {
          "bash-language-server",
          condition = function()
            return vim.fn.executable "bash" == 1 and vim.fn.executable "npm" == 1
          end,
        },

        -- YAML
        {
          "yaml-language-server",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },

        -- Docker
        {
          "dockerfile-language-server",
          condition = function()
            return vim.fn.executable "docker" == 1 and vim.fn.executable "npm" == 1
          end,
        },

        -- Docker Compose
        {
          "docker-compose-language-service",
          condition = function()
            return vim.fn.executable "docker-compose" == 1 and vim.fn.executable "npm" == 1
          end,
        },

        -- Tailwind CSS
        {
          "tailwindcss-language-server",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },

        -- Vim
        {
          "vim-language-server",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },

        -- TypeScript
        {
          "typescript-language-server",
          condition = function()
            return vim.fn.executable "npm" == 1 or vim.fn.executable "node" == 1
          end,
        },

        -- HTML
        {
          "html-lsp",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },

        -- JSON
        {
          "json-lsp",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },

        -- PHP (phpactor)
        {
          "phpactor",
          condition = function()
            return vim.fn.executable "php" == 1
          end,
        },

        -- Protocol Buffers
        {
          "buf-language-server",
          condition = function()
            return vim.fn.executable "buf" == 1
          end,
        },

        -- C# (Roslyn)
        {
          "roslyn",
          condition = function()
            return vim.fn.executable "dotnet" == 1
          end,
        },

        -- Svelte
        {
          "svelte-language-server",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },

        -- Robot Framework
        {
          "robotframework-lsp",
          condition = function()
            return vim.fn.executable "python3" == 1 or vim.fn.executable "python" == 1
          end,
        },

        -- LTeX (Grammar/Spell checking)
        {
          "ltex-ls",
          condition = function()
            return vim.fn.executable "java" == 1
          end,
        },

        -- Python LSP
        {
          "python-lsp-server",
          condition = function()
            return vim.fn.executable "python3" == 1 or vim.fn.executable "python" == 1
          end,
        },

        -- CSS
        {
          "css-lsp",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },

        -- C/C++ (Clangd)
        {
          "clangd",
          condition = function()
            return vim.fn.executable "clang" == 1 or vim.fn.executable "gcc" == 1
          end,
        },

        -- Angular
        {
          "angular-language-server",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },
      },

      -- Auto update installed tools
      auto_update = true,

      -- Run on start
      run_on_start = true,

      -- Debounce hours for auto update
      debounce_hours = 5,
    }

    -- LSP Config
    local lspconfig = require "lspconfig"
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Diagnostic signs
    vim.diagnostic.config {
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
    }

    -- Common on_init function to disable semantic tokens for all servers
    local function common_on_init(client, _)
      if client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
      end
    end

    -- Function to setup LSP servers with common settings
    local function setup_server(server, config)
      config = config or {}
      local default_config = {
        capabilities = capabilities,
        on_init = common_on_init,
      }

      local ok, err = pcall(function()
        lspconfig[server].setup(vim.tbl_extend("force", default_config, config))
      end)
      if not ok then
        vim.notify("Failed to setup " .. server .. ": " .. err, vim.log.levels.ERROR)
      end
    end

    -- All servers with their specific configurations
    local servers = {
      -- Simple servers (no extra config needed)
      cmake = {},
      cssmodules_ls = {},
      gopls = {},
      templ = {},
      bashls = {},
      marksman = {},
      yamlls = {},
      dockerls = {},
      docker_compose_language_service = {},
      tailwindcss = {},
      vimls = {},
      ts_ls = {},
      html = {},
      jsonls = {},
      phpactor = {},
      pbls = {},
      roslyn = {},

      -- Servers with specific configurations
      lua_ls = {
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
      },

      svelte = {
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
      },

      robotframework_ls = {
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
      },

      ltex = {
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
      },

      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                maxLineLength = 120,
              },
            },
          },
        },
      },

      cssls = {
        filetypes = { "css", "scss", "sass" },
      },

      clangd = {
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      },

      angularls = {
        root_dir = lspconfig.util.root_pattern("angular.json", "nx.json"),
      },
    }

    -- Setup all servers
    for server, config in pairs(servers) do
      setup_server(server, config)
    end
  end,
}

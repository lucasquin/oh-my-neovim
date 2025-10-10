return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
    {
      "seblyng/roslyn.nvim",
      opts = {
        lock_target = true,
      },
    },
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

    -- Tool installer configuration
    require("mason-tool-installer").setup {
      ensure_installed = {
        -- lua
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
        {
          "templ",
          condition = function()
            return vim.fn.executable "go" == 1
          end,
        },

        -- Web Development
        {
          "cssmodules-language-server",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },
        {
          "tailwindcss-language-server",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },
        {
          "typescript-language-server",
          condition = function()
            return vim.fn.executable "npm" == 1 or vim.fn.executable "node" == 1
          end,
        },
        {
          "html-lsp",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },
        {
          "json-lsp",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },
        {
          "css-lsp",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },
        {
          "svelte-language-server",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },
        {
          "angular-language-server",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },

        -- Documentation
        {
          "marksman",
          condition = function()
            return true
          end,
        },
        {
          "ltex-ls",
          condition = function()
            return vim.fn.executable "java" == 1
          end,
        },

        -- DevOps
        {
          "bash-language-server",
          condition = function()
            return vim.fn.executable "bash" == 1 and vim.fn.executable "npm" == 1
          end,
        },
        {
          "yaml-language-server",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },
        {
          "dockerfile-language-server",
          condition = function()
            return vim.fn.executable "docker" == 1 and vim.fn.executable "npm" == 1
          end,
        },
        {
          "docker-compose-language-service",
          condition = function()
            return vim.fn.executable "docker-compose" == 1 and vim.fn.executable "npm" == 1
          end,
        },

        -- Programming Languages
        {
          "cmake-language-server",
          condition = function()
            return vim.fn.executable "cmake" == 1 and vim.fn.executable "pip3" == 1
          end,
        },
        {
          "vim-language-server",
          condition = function()
            return vim.fn.executable "npm" == 1
          end,
        },
        {
          "phpactor",
          condition = function()
            return vim.fn.executable "php" == 1
          end,
        },
        {
          "buf-language-server",
          condition = function()
            return vim.fn.executable "buf" == 1
          end,
        },
        {
          "roslyn",
          condition = function()
            return vim.fn.executable "dotnet" == 1
          end,
        },
        {
          "robotframework-lsp",
          condition = function()
            return vim.fn.executable "python3" == 1 or vim.fn.executable "python" == 1
          end,
        },
        {
          "python-lsp-server",
          condition = function()
            return vim.fn.executable "python3" == 1 or vim.fn.executable "python" == 1
          end,
        },
        {
          "clangd",
          condition = function()
            return vim.fn.executable "clang" == 1 or vim.fn.executable "gcc" == 1
          end,
        },
      },
      auto_update = true,
      run_on_start = true,
      debounce_hours = 5,
    }

    -- Get utilities from lspconfig
    local util = require "lspconfig.util"

    -- Enhanced capabilities with nvim-cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Try to enhance with cmp_nvim_lsp if available
    local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if ok then
      capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
    end

    -- Enhanced diagnostic configuration
    vim.diagnostic.config {
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
      },
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "󰌵",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
    }

    -- Enhanced on_attach function with keybindings
    local function on_attach(client, bufnr)
      if client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
      end
      -- if client.supports_method "textDocument/inlayHint" then
      --   vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      -- end
    end

    local servers = {
      -- Lua
      lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_dir = util.root_pattern(
          ".luarc.json",
          ".luarc.jsonc",
          ".luacheckrc",
          ".stylua.toml",
          "stylua.toml",
          "selene.toml",
          "selene.yml",
          ".git"
        ),
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
              path = vim.split(package.path, ";"),
            },
            diagnostics = {
              globals = { "vim", "describe", "it", "before_each", "after_each" },
            },
            workspace = {
              library = {
                vim.fn.expand "$VIMRUNTIME/lua",
                vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
                vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                "${3rd}/luv/library",
              },
              checkThirdParty = false,
              maxPreload = 100000,
              preloadFileSize = 10000,
            },
            completion = {
              callSnippet = "Replace",
              keywordSnippet = "Replace",
            },
            telemetry = {
              enable = false,
            },
            hint = {
              enable = true,
            },
          },
        },
      },

      -- Go
      gopls = {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            staticcheck = true,
            gofumpt = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      },

      -- TypeScript/JavaScript
      ts_ls = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
        init_options = {
          preferences = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
            importModuleSpecifierPreference = "non-relative",
          },
        },
      },

      -- Python
      pylsp = {
        cmd = { "pylsp" },
        filetypes = { "python" },
        root_dir = util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git"),
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                maxLineLength = 120,
                ignore = { "W503", "E501" },
              },
              pylint = {
                enabled = true,
                executable = "pylint",
              },
              pyflakes = {
                enabled = false,
              },
              black = {
                enabled = true,
              },
              isort = {
                enabled = true,
              },
              mypy = {
                enabled = true,
              },
            },
          },
        },
      },

      -- C/C++
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        root_dir = util.root_pattern(
          ".clangd",
          ".clang-tidy",
          ".clang-format",
          "compile_commands.json",
          "compile_flags.txt",
          "configure.ac",
          ".git"
        ),
        capabilities = vim.tbl_deep_extend("force", capabilities, {
          offsetEncoding = { "utf-16" },
        }),
      },

      -- Svelte
      svelte = {
        cmd = { "sveltekit-language-server", "--stdio" },
        filetypes = { "svelte" },
        root_dir = util.root_pattern("svelte.config.js", "svelte.config.cjs", "svelte.config.mjs", "package.json"),
        settings = {
          svelte = {
            plugin = {
              typescript = {
                enable = true,
                diagnostics = { enable = true },
              },
              svelte = {
                enable = true,
                diagnostics = { enable = true },
                compilerWarnings = {
                  ["a11y-no-onchange"] = "ignore",
                },
                defaultScriptLanguage = "ts",
              },
              html = {
                enable = true,
                hover = { enable = true },
                completions = { enable = true },
              },
              css = {
                enable = true,
                hover = { enable = true },
                completions = { enable = true },
              },
            },
          },
        },
      },

      cssmodules_ls = {
        cmd = { "cssmodules-language-server" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_dir = util.root_pattern "package.json",
      },

      templ = {
        cmd = { "templ", "lsp" },
        filetypes = { "templ" },
        root_dir = util.root_pattern("go.mod", ".git"),
      },

      bashls = {
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh", "bash", "zsh" },
        root_dir = util.find_git_ancestor,
      },

      marksman = {
        cmd = { "marksman", "server" },
        filetypes = { "markdown", "markdown.mdx" },
        root_dir = util.root_pattern(".marksman.toml", ".git"),
      },

      yamlls = {
        cmd = { "yaml-language-server", "--stdio" },
        filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
        root_dir = util.find_git_ancestor,
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
            },
          },
        },
      },

      dockerls = {
        cmd = { "docker-langserver", "--stdio" },
        filetypes = { "dockerfile" },
        root_dir = util.root_pattern "Dockerfile",
      },

      docker_compose_language_service = {
        cmd = { "docker-compose-langserver", "--stdio" },
        filetypes = { "yaml.docker-compose" },
        root_dir = util.root_pattern("docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml"),
      },

      tailwindcss = {
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "vue" },
        root_dir = util.root_pattern("tailwind.config.js", "tailwind.config.cjs", "tailwind.config.mjs", "tailwind.config.ts"),
        settings = {
          tailwindCSS = {
            validate = true,
            lint = {
              cssConflict = "warning",
              invalidApply = "error",
              invalidScreen = "error",
              invalidVariant = "error",
              invalidConfigPath = "error",
              invalidTailwindDirective = "error",
              recommendedVariantOrder = "warning",
            },
          },
        },
      },

      vimls = {
        cmd = { "vim-language-server", "--stdio" },
        filetypes = { "vim" },
        root_dir = util.find_git_ancestor,
      },

      html = {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html", "templ" },
        root_dir = util.root_pattern("package.json", ".git"),
      },

      jsonls = {
        cmd = { "vscode-json-language-server", "--stdio" },
        filetypes = { "json", "jsonc" },
        root_dir = util.find_git_ancestor,
        init_options = {
          provideFormatter = true,
        },
      },

      phpactor = {
        cmd = { "phpactor", "language-server" },
        filetypes = { "php" },
        root_dir = util.root_pattern("composer.json", ".git"),
      },

      pbls = {
        cmd = { "pbls" },
        filetypes = { "proto" },
        root_dir = util.root_pattern ".git",
      },

      roslyn = {},

      robotframework_ls = {
        cmd = { "robotframework_ls" },
        filetypes = { "robot", "resource" },
        root_dir = util.root_pattern("robot.yaml", ".git"),
        settings = {
          robot = {
            python = {
              executable = vim.fn.executable "python3" == 1 and "python3" or "python",
            },
            lint = {
              enabled = true,
              undefinedLibraries = true,
              robocop = {
                enabled = true,
              },
            },
          },
        },
      },

      ltex = {
        cmd = { "ltex-ls" },
        filetypes = { "bibtex", "gitcommit", "markdown", "org", "tex", "restructuredtext", "rsweave", "latex", "quarto", "rmd", "context" },
        root_dir = util.find_git_ancestor,
        settings = {
          ltex = {
            language = "en-US",
            checkFrequency = "save",
            diagnosticSeverity = "information",
            additionalRules = {
              enablePickyRules = true,
              motherTongue = "en-US",
            },
          },
        },
      },

      cssls = {
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "sass", "less" },
        root_dir = util.root_pattern("package.json", ".git"),
        settings = {
          css = {
            validate = true,
            lint = {
              unknownAtRules = "warning",
            },
          },
          scss = {
            validate = true,
            lint = {
              unknownAtRules = "warning",
            },
          },
        },
      },

      cmake = {
        cmd = { "cmake-language-server" },
        filetypes = { "cmake" },
        root_dir = util.root_pattern("CMakePresets.json", "CMakeLists.txt", ".git"),
        init_options = {
          buildDirectory = "build",
        },
      },

      angularls = {
        cmd = { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" },
        filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "component.html" },
        root_dir = util.root_pattern("angular.json", "nx.json"),
      },
    }

    -- Default configuration for all servers
    local default_config = {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },
    }

    -- Setup all servers using vim.lsp.config
    for name, config in pairs(servers) do
      -- Merge with default config
      local server_config = vim.tbl_deep_extend("force", default_config, config)

      -- Register the server configuration
      vim.lsp.config[name] = server_config

      -- Auto-start LSP for matching filetypes
      if server_config.filetypes then
        vim.api.nvim_create_autocmd("FileType", {
          pattern = server_config.filetypes,
          callback = function(args)
            -- Skip if LSP is already attached
            local clients = vim.lsp.get_clients { bufnr = args.buf, name = name }
            if #clients == 0 then
              vim.lsp.start(server_config, {
                bufnr = args.buf,
                name = name,
                root_dir = server_config.root_dir and server_config.root_dir(vim.api.nvim_buf_get_name(args.buf)),
              })
            end
          end,
          desc = string.format("Start LSP server %s", name),
        })
      end
    end

    -- Additional LSP keymaps (global)
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostics float" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Set diagnostics to location list" })

    -- LspInfo command for debugging
    vim.api.nvim_create_user_command("LspInfo", function()
      local clients = vim.lsp.get_clients()
      if #clients == 0 then
        print "No active LSP clients"
        return
      end
      for _, client in ipairs(clients) do
        print(string.format("LSP: %s (id: %d, buffers: %s)", client.name, client.id, vim.inspect(vim.tbl_keys(client.attached_buffers))))
      end
    end, { desc = "Show active LSP clients" })
  end,
}

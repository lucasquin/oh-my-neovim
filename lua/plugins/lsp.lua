return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    {
      "seblyng/roslyn.nvim",
      opts = {
        lock_target = true,
        ignore_target = function(target)
          return string.match(target:lower(), "test") ~= nil
        end,
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
          package_pending = " ",
          package_installed = " ",
          package_uninstalled = " ",
        },
      },
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    vim.diagnostic.config {
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
      },
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        header = "",
        prefix = "",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
    }

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    local servers = {
      lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
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

      gopls = {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
              ST1000 = false,
            },
            staticcheck = true,
            gofumpt = true,
            usePlaceholders = true,
            completeUnimported = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
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

      ts_ls = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
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

      cssmodules_ls = {
        cmd = { "cssmodules-language-server" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      },

      templ = {
        cmd = { "templ", "lsp" },
        filetypes = { "templ" },
      },

      bashls = {
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh", "bash", "zsh" },
      },

      marksman = {
        cmd = { "marksman", "server" },
        filetypes = { "markdown", "markdown.mdx" },
      },

      yamlls = {
        cmd = { "yaml-language-server", "--stdio" },
        filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yml" },
      },

      dockerls = {
        cmd = { "docker-langserver", "--stdio" },
        filetypes = { "dockerfile" },
      },

      docker_compose_language_service = {
        cmd = { "docker-compose-langserver", "--stdio" },
        filetypes = { "yaml.docker-compose" },
      },

      tailwindcss = {
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "vue" },
        root_dir = function(bufnr, on_dir)
          local root_files = {
            "tailwind.config.js",
            "tailwind.config.cjs",
            "tailwind.config.mjs",
            "tailwind.config.ts",
            "postcss.config.js",
            "postcss.config.cjs",
            "postcss.config.mjs",
            "postcss.config.ts",
            "theme/static_src/tailwind.config.js",
            "theme/static_src/tailwind.config.cjs",
            "theme/static_src/tailwind.config.mjs",
            "theme/static_src/tailwind.config.ts",
            "theme/static_src/postcss.config.js",
            ".git",
          }
          local fname = vim.api.nvim_buf_get_name(bufnr)
          on_dir(vim.fs.dirname(vim.fs.find(root_files, { path = fname, upward = true })[1]))
        end,
      },

      html = {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html", "templ" },
      },

      jsonls = {
        cmd = { "vscode-json-language-server", "--stdio" },
        filetypes = { "json", "jsonc" },
        init_options = {
          provideFormatter = true,
        },
      },

      roslyn = {},

      cssls = {
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "sass", "less" },
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

      -- cmake = {
      --   cmd = { "cmake-language-server" },
      --   filetypes = { "cmake" },
      --   init_options = {
      --     buildDirectory = "build",
      --   },
      -- },

      rust_analyzer = {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
            cargo = {
              allFeatures = true,
            },
            procMacro = {
              enable = true,
            },
            inlayHints = {
              lifetimeElisionHints = {
                enable = "always",
              },
            },
          },
        },
      },

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
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
      },
    }

    require("mason-lspconfig").setup {
      automatic_enable = vim.tbl_keys(servers or {}),
    }

    local ensure_installed = vim.tbl_keys(servers or {})

    vim.list_extend(ensure_installed, {
      "stylua",
      "gofumpt",
      "goimports",
      "shfmt",
      "prettier",
      "codelldb",
    })

    require("mason-tool-installer").setup { ensure_installed = ensure_installed }

    for server_name, config in pairs(servers) do
      vim.lsp.config(server_name, config)
    end
  end,
}

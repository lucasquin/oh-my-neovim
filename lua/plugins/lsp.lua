return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim", "Hoffs/omnisharp-extended-lsp.nvim" },
  config = function()
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

    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls", "marksman" },
      automatic_installation = true,
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local lsp = vim.lsp.config

    -- Simple servers configuration
    lsp("cmake", { capabilities = capabilities })
    lsp("cssmodules_ls", { capabilities = capabilities })
    lsp("gopls", { capabilities = capabilities })
    lsp("templ", { capabilities = capabilities })
    lsp("bashls", { capabilities = capabilities })
    lsp("marksman", { capabilities = capabilities })
    lsp("yamlls", { capabilities = capabilities })
    lsp("dockerls", { capabilities = capabilities })
    lsp("docker_compose_language_service", { capabilities = capabilities })
    lsp("tailwindcss", { capabilities = capabilities })
    lsp("vimls", { capabilities = capabilities })
    lsp("ts_ls", { capabilities = capabilities })
    lsp("html", { capabilities = capabilities })
    lsp("jsonls", { capabilities = capabilities })
    lsp("phpactor", { capabilities = capabilities })
    lsp("pbls", { capabilities = capabilities })

    -- Lua
    lsp("lua_ls", {
      capabilities = capabilities,
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if path ~= vim.fn.stdpath "config" and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc")) then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            version = "LuaJIT",
            path = {
              "lua/?.lua",
              "lua/?/init.lua",
            },
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              "${3rd}/luv/library",
              "${3rd}/busted/library",
            },
          },
        })
      end,
      settings = {
        Lua = {},
      },
    })

    -- Svelte
    lsp("svelte", {
      capabilities = capabilities,
      filetypes = { "svelte" },
      root_dir = function(fname)
        return vim.fs.dirname(vim.fs.find({ "svelte.config.cjs", "svelte.config.js" }, {
          upward = true,
          path = vim.fs.dirname(fname),
        })[1] or "")
      end,
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
    lsp("robotframework_ls", {
      capabilities = capabilities,
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
    lsp("ltex", {
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
    })

    -- Python
    lsp("pylsp", {
      capabilities = capabilities,
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
    lsp("cssls", {
      capabilities = capabilities,
      filetypes = { "css", "scss", "sass" },
    })

    -- C / C++
    lsp("clangd", {
      capabilities = capabilities,
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    })

    -- Angular
    lsp("angularls", {
      capabilities = capabilities,
      root_dir = function(fname)
        return vim.fs.dirname(vim.fs.find({ "angular.json", "nx.json", "package.json" }, {
          upward = true,
          path = vim.fs.dirname(fname),
        })[1] or "")
      end,
    })

    -- C#
    lsp("omnisharp", {
      capabilities = capabilities,
      cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
      on_attach = function(client, _)
        client.server_capabilities.semanticTokensProvider = nil
      end,
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
      filetypes = { "cs", "vb", "csproj", "sln" },
      settings = {
        FormattingOptions = {
          EnableEditorConfigSupport = true,
          OrganizeImports = true,
        },
        MsBuild = {
          LoadProjectsOnDemand = true,
        },
        RoslynExtensionsOptions = {
          EnableAnalyzersSupport = false,
          EnableImportCompletion = true,
          AnalyzeOpenDocumentsOnly = false,
          EnableDecompilationSupport = true,
        },
        CacheDirectory = vim.fn.stdpath "cache" .. "/omnisharp",
        CachingOptions = {
          EnableLspCaching = true,
          TypeCacheSizeInMb = 300,
        },
        Sdk = {
          IncludePrereleases = true,
        },
        init_options = {
          AutomaticWorkspaceInit = true,
          EnableMsBuildLoadProjectsOnDemand = true,
          EnableImportCompletion = true,
          EnableAnalyzersSupport = false,
          HighlightScope = false,
        },
      },
    })
  end,
}

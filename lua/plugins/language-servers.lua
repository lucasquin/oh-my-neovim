return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
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
      ensure_installed = { "lua_ls" },
    }

    -- LSP Config
    local lspconfig = require "lspconfig"
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Define diagnostic signs
    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

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
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if
            path ~= vim.fn.stdpath "config" and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc"))
          then
            return
          end
        end
        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              "${3rd}/luv/library",
            },
          },
        })
      end,
      settings = {
        Lua = {},
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
              ignore = { "W391", "W503" },
              maxLineLength = 140,
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
  end,
}

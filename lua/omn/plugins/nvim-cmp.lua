return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "onsails/lspkind-nvim",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
  },
  config = function()
    local luasnip = require "luasnip"
    local cmp = require "cmp"
    local lspkind = require "lspkind"
    local tailwind_formatter = require("tailwindcss-colorizer-cmp").formatter

    require("luasnip/loaders/from_vscode").lazy_load()

    luasnip.filetype_extend("typescriptreact", { "html" })

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 3, max_item_count = 5 },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "nvim_lsp_signature_help" },
      },
      formatting = {
        fields = { cmp.ItemField.Menu, cmp.ItemField.Abbr, cmp.ItemField.Kind },
        format = lspkind.cmp_format {
          with_text = true,
          before = tailwind_formatter,
        },
      },
      window = {
        completion = {
          border = "rounded",
        },
        documentation = cmp.config.window.bordered(),
      },
    }
  end,
}

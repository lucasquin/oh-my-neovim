return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  opts = {
    signature = {
      enabled = true,
      window = {
        border = "single",
      },
    },
    keymap = {
      ["<TAB>"] = { "select_next", "fallback" },
      ["<S-TAB>"] = { "select_prev", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      throttle_ms = 50,
      trigger_min_chars = 2,
      max_items = 10,
      menu = {
        border = "single",
        winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:CursorLine,Search:None",
        draw = {
          columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
        },
      },
      documentation = {
        window = {
          border = "single",
        },
        auto_show = true,
        auto_show_delay_ms = 500,
        treesitter_highlighting = true,
      },
      cache = {
        buffer = true,
        path = true,
        ttl_seconds = 120,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      matcher = {
        distance_bonus = true,
        prefix_bonus_weight = 2.0,
        distance_penalty_weight = 0.6,
        consecutive_bonus_weight = 1.5,
      },
    },
    async = true,
    preload_sources = { "lsp" },
  },
  opts_extend = { "sources.default" },
}

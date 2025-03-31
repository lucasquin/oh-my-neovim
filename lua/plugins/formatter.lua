return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofumpt", "goimports" },
        robot = { "robotframework_ls" },
        sh = { "shfmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        graphql = { "prettier" },
        markdown = { "prettier" },
        svelte = { "prettier --plugin prettier-plugin-svelte" },
        cs = { "csharpier --print-width 120" },
        php = { "phpcbf" },
        proto = { "buf" },
      },
    }
  end,
}

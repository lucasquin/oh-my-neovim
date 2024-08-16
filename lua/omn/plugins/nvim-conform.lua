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
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        graphql = { "prettierd" },
        markdown = { "prettierd" },
        svelte = { "prettierd --plugin prettier-plugin-svelte" },
        cs = { "csharpier" },
        php = { "phpcbf" },
      },
    }
  end,
}

return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  config = function()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

    require("ufo").setup {
      close_fold_kinds_for_ft = {
        default = { "imports", "comment", "region", "using" },
        json = { "array" },
        c = { "comment", "region" },
      },
      provider_selector = function(bufnr, filetype, buftype)
        if filetype == "neo-tree" then
          return ""
        end

        return { "treesitter", "indent" }
      end,
    }
  end,
}


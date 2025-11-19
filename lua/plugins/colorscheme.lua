return {
  {
    "Mofiqul/dracula.nvim",
  },
  {
    "folke/tokyonight.nvim",
  },
  {
    "lucasquin/arctic.nvim",
    branch = "v2",
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      vim.cmd [[colorscheme arctic]]
    end,
  },
}

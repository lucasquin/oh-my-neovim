return {
  {
    "Mofiqul/dracula.nvim",
  },
  {
    "folke/tokyonight.nvim",
  },
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "lucasquin/arctic.nvim",
    branch = "v2",
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
}

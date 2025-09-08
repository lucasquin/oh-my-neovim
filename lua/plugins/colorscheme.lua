return {
  {
    "Mofiqul/dracula.nvim",
  },
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd [[colorscheme tokyonight-night]]
    end,
  },
  {
    "rockyzhang24/arctic.nvim",
    branch = "v2",
    dependencies = { "rktjmp/lush.nvim" },
  },
}

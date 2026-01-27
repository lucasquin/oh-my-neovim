return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
    "LiadOz/nvim-dap-repl-highlights",
  },
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  config = function()
    require("nvim-dap-repl-highlights").setup()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "lua", "vim", "vimdoc", "typescript", "javascript", "html", "css", "dap_repl" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 200 * 1024 -- 200 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = true,
        use_languagetree = true,
      },
    }
  end,
}

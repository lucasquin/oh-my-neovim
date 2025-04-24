local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

local function load_plugins(directory)
  local plugins = {}
  local plugin_files = vim.fn.globpath(directory, "*.lua", false, true)
  for _, file in ipairs(plugin_files) do
    local plugin_name = vim.fn.fnamemodify(file, ":t:r")
    if plugin_name ~= "init" then
      local status, plugin = pcall(require, "plugins." .. plugin_name)
      if status then
        table.insert(plugins, plugin)
      else
        vim.notify("Failed to load plugin: " .. plugin_name, vim.log.levels.ERROR)
      end
    end
  end

  return plugins
end

local plugins = load_plugins(vim.fn.stdpath "config" .. "/lua/plugins")

local opts = {
  install = {
    colorscheme = { "tokyonight-night" },
  },
  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}

require("lazy").setup(plugins, opts)

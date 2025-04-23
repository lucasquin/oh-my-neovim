local numbertoggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  pattern = "*",
  group = numbertoggle,
  callback = function()
    if vim.wo.number and vim.fn.mode() ~= "i" then
      vim.wo.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  pattern = "*",
  group = numbertoggle,
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = false
    end
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local neo_tree_normal_hl = vim.api.nvim_get_hl(0, { name = "NeoTreeNormal" })
    vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#303300" })
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = neo_tree_normal_hl.bg, fg = neo_tree_normal_hl.bg })
  end,
})

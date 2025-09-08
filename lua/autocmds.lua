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

local function darken_color(hex_color, percentage)
  if not hex_color or hex_color == "NONE" then
    return "#1a1a1a"
  end

  hex_color = hex_color:gsub("#", "")

  local r = tonumber(hex_color:sub(1, 2), 16)
  local g = tonumber(hex_color:sub(3, 4), 16)
  local b = tonumber(hex_color:sub(5, 6), 16)

  local factor = (100 - percentage) / 100
  r = math.floor(r * factor)
  g = math.floor(g * factor)
  b = math.floor(b * factor)

  return string.format("#%02x%02x%02x", r, g, b)
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
    local bg_color = normal_hl.bg

    if type(bg_color) == "number" then
      bg_color = string.format("#%06x", bg_color)
    end

    local darker_bg = darken_color(bg_color, 20)

    vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#303300" })
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = darker_bg })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = darker_bg })
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = darker_bg, fg = darker_bg })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = bg_color })
  end,
})

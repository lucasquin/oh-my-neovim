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

local handles = {}

vim.api.nvim_create_autocmd("User", {
  pattern = "RoslynRestoreProgress",
  callback = function(ev)
    local token = ev.data.params[1]
    local handle = handles[token]
    if handle then
      handle:report {
        title = ev.data.params[2].state,
        message = ev.data.params[2].message,
      }
    else
      handles[token] = require("fidget.progress").handle.create {
        title = ev.data.params[2].state,
        message = ev.data.params[2].message,
        lsp_client = {
          name = "roslyn",
        },
      }
    end
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "RoslynRestoreResult",
  callback = function(ev)
    local handle = handles[ev.data.token]
    handles[ev.data.token] = nil

    if handle then
      handle.message = ev.data.err and ev.data.err.message or "Restore completed"
      handle:finish()
    end
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf

    if client and (client.name == "roslyn" or client.name == "roslyn_ls") then
      vim.api.nvim_create_autocmd("InsertCharPre", {
        desc = "Roslyn: Trigger an auto insert on '/'.",
        buffer = bufnr,
        callback = function()
          local char = vim.v.char

          if char ~= "/" then
            return
          end

          local row, col = unpack(vim.api.nvim_win_get_cursor(0))
          row, col = row - 1, col + 1
          local uri = vim.uri_from_bufnr(bufnr)

          local params = {
            _vs_textDocument = { uri = uri },
            _vs_position = { line = row, character = col },
            _vs_ch = char,
            _vs_options = {
              tabSize = vim.bo[bufnr].tabstop,
              insertSpaces = vim.bo[bufnr].expandtab,
            },
          }

          vim.defer_fn(function()
            client:request(
              ---@diagnostic disable-next-line: param-type-mismatch
              "textDocument/_vs_onAutoInsert",
              params,
              function(err, result, _)
                if err or not result then
                  return
                end

                vim.snippet.expand(result._vs_textEdit.newText)
              end,
              bufnr
            )
          end, 1)
        end,
      })
    end
  end,
})

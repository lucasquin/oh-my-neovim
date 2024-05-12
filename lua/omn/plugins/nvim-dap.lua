return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "rcarriga/nvim-dap-ui" },
    { "nvim-neotest/nvim-nio" },
    { "theHamsta/nvim-dap-virtual-text" },
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    vim.fn.sign_define("DapBreakpoint", { text = "⬤", texthl = "DiagnosticError", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "DiagnosticInfo", numhl = "" })
    vim.fn.sign_define(
      "DapStopped",
      { text = "󰁕 ", texthl = "DiagnosticWarn", linehl = "DapStoppedLine", numhl = "DapStoppedLine" }
    )
    vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "", linehl = "", numhl = "" })

    require("nvim-dap-virtual-text").setup()

    dapui.setup {
      ui = {
        auto_open = true,
        notify = {
          threshold = vim.log.levels.INFO,
        },
        config = {
          icons = { expanded = "", collapsed = "", circular = "" },
          mappings = {
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t",
          },
          element_mappings = {},
          expand_lines = true,
          layouts = {
            {
              elements = {
                { id = "scopes", size = 0.33 },
                { id = "breakpoints", size = 0.17 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 },
              },
              size = 0.33,
              position = "right",
            },
            {
              elements = {
                { id = "repl", size = 0.45 },
                { id = "console", size = 0.55 },
              },
              size = 0.27,
              position = "bottom",
            },
          },
          controls = {
            enabled = true,
            element = "repl",
            icons = {
              pause = "",
              play = "",
              step_into = "",
              step_over = "",
              step_out = "",
              step_back = "",
              run_last = "",
              terminate = "",
            },
          },
          floating = {
            max_height = 0.9,
            max_width = 0.5,
            border = "rounded",
            mappings = {
              close = { "q", "<Esc>" },
            },
          },
          windows = { indent = 1 },
          render = {
            max_type_length = nil,
            max_value_lines = 100,
          },
        },
      },
    }

    dap.listeners.after.event_initialized["dapui_config"] = function()
      vim.cmd ":Neotree close"
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
      vim.cmd ":Neotree"
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
      vim.cmd ":Neotree"
    end

    -- Golang / delve
    local function getMainGoFilePath()
      local main_path = vim.fn.getcwd() .. "/main.go"
      local dir_entry = vim.loop.fs_stat(main_path)
      if dir_entry and dir_entry.type == "file" then
        return main_path
      else
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end
    end

    dap.adapters = {
      go = function(callback)
        local handle
        local port = 38697
        handle = vim.loop.spawn("dlv", {
          args = { "dap", "-l", "127.0.0.1:" .. port },
          detached = true,
        }, function(_)
          handle:close()
        end)
        vim.defer_fn(function()
          callback { type = "server", host = "127.0.0.1", port = port }
        end, 100)
      end,
    }

    dap.configurations = {
      go = {
        {
          type = "go",
          name = "Launch",
          request = "launch",
          program = getMainGoFilePath,
          repl_lang = "go",
        },
        {
          type = "go",
          name = "Launch test",
          request = "launch",
          mode = "test",
          program = getMainGoFilePath,
          repl_lang = "go",
        },
      },
    }
  end,
}

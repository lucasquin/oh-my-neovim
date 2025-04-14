return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "igorlfs/nvim-dap-view" },
  },
  config = function()
    local dap, dv = require "dap", require "dap-view"

    dv.setup {
      winbar = {
        sections = { "scopes", "watches", "exceptions", "breakpoints", "repl" },
        default_section = "scopes",
      },
      windows = {
        height = 20,
        terminal = {
          hide = { "delve", "coreclr" },
        },
      },
    }

    vim.fn.sign_define("DapBreakpoint", { text = "⬤", texthl = "DiagnosticError", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "DiagnosticInfo", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "󰁕 ", texthl = "DiagnosticWarn", linehl = "DapStoppedLine", numhl = "DiagnosticWarn" })
    vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "", linehl = "", numhl = "" })

    dap.listeners.before.attach["dap-view-config"] = function()
      vim.cmd ":Neotree close"
      dv.open()
    end
    dap.listeners.before.launch["dap-view-config"] = function()
      vim.cmd ":Neotree close"
      dv.open()
    end
    dap.listeners.before.event_terminated["dap-view-config"] = function()
      dv.close(true)
      vim.cmd ":Neotree show"
    end
    dap.listeners.before.event_exited["dap-view-config"] = function()
      dv.close(true)
      vim.cmd ":Neotree show"
    end

    -- Golang
    local function getMainGoFilePath()
      local main_path = vim.fn.getcwd() .. "/main.go"
      local dir_entry = vim.loop.fs_stat(main_path)
      if dir_entry and dir_entry.type == "file" then
        return main_path
      else
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end
    end

    dap.adapters.delve = {
      type = "server",
      host = "127.0.0.1",
      port = "8086",
      executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:8086", "--log" },
      },
    }
    dap.configurations.go = {
      {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = getMainGoFilePath,
        repl_lang = "go",
      },
      {
        type = "delve",
        name = "Launch test",
        request = "launch",
        mode = "test",
        program = getMainGoFilePath,
        repl_lang = "go",
      },
    }

    -- C#
    dap.adapters.coreclr = {
      type = "executable",
      command = vim.fn.stdpath "data" .. "/mason/bin/netcoredbg",
      args = { "--interpreter=vscode" },
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "Attach to .NET Process (by Port)",
        request = "attach",
        symbolOptions = {
          searchPaths = {
            "${workspaceFolder}/bin/Debug/net9.0/",
            searchMicrosoftSymbolServer = true,
            searchNuGetOrgSymbolServer = true,
          },
        },
        justMyCode = false,
        processId = function()
          local port = vim.fn.input "Enter the port number: "
          if not port or port == "" then
            return nil
          end

          local handle = io.popen("lsof -i :" .. port .. " -sTCP:LISTEN -t")
          if not handle then
            print "Failed to run lsof"
            return nil
          end

          local pid = handle:read("*a"):match "%d+"
          handle:close()

          if not pid then
            print("No process found listening on port " .. port)
            return nil
          end

          print("Attaching to PID: " .. pid)
          return tonumber(pid)
        end,
      },
    }
  end,
}

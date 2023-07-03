local HOME = os.getenv("USERPROFILE")
local DEBUGGER_LOCATION = HOME .. "/.local/share/nvim/netcoredbg"

local dap = require("dap")

-- To get name of OS systme
-- vim.loop.os_uname().sysname

dap.setup({
	adapters = {
		coreclr = {
			type = "executable",
			command = DEBUGGER_LOCATION .. "/netcoredbg",
			args = { "--interpreter=vscode" },
		},
	},
	configurations = {
		cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to DLL > ", vim.fn.getcwd() .. "/bin/Debug/", "file")
				end,
			},
		},
	},
})

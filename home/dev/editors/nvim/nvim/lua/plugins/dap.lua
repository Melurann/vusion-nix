return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		-- NixOS has no /usr/bin; resolve lldb-dap (or the older lldb-vscode
		-- name) from PATH instead of hardcoding an FHS path.
		local lldb_adapter = vim.fn.exepath("lldb-dap")
		if lldb_adapter == "" then
			lldb_adapter = vim.fn.exepath("lldb-vscode")
		end

		dap.adapters.lldb = {
			type = "executable",
			command = lldb_adapter,
			name = "lldb",
		}

		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},

				runInTerminal = false,
			},
		}
	end,
}

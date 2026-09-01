local function executable(path)
	return vim.fn.executable(path) == 1
end

return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{ "<F5>", function() require("dap").continue() end, desc = "Iniciar o continuar depuración" },
			{ "<F10>", function() require("dap").step_over() end, desc = "Paso sobre" },
			{ "<F11>", function() require("dap").step_into() end, desc = "Paso dentro" },
			{ "<F12>", function() require("dap").step_out() end, desc = "Paso fuera" },
			{ "<leader>Db", function() require("dap").toggle_breakpoint() end, desc = "Alternar breakpoint" },
			{
				"<leader>DB",
				function()
					require("dap").set_breakpoint(vim.fn.input("Condición: "))
				end,
				desc = "Breakpoint condicional",
			},
			{ "<leader>Dc", function() require("dap").run_to_cursor() end, desc = "Ejecutar hasta el cursor" },
			{ "<leader>Dl", function() require("dap").run_last() end, desc = "Repetir última depuración" },
			{ "<leader>Dr", function() require("dap").repl.toggle() end, desc = "Alternar REPL" },
			{ "<leader>Dt", function() require("dap").terminate() end, desc = "Terminar depuración" },
			{ "<leader>Du", function() require("dapui").toggle() end, desc = "Alternar interfaz" },
		},

		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				dependencies = {
					"nvim-neotest/nvim-nio",
				},
			},
			"mfussenegger/nvim-dap-python",
		},

		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local mason = vim.fn.stdpath("data") .. "/mason/packages"

			dapui.setup({
				icons = {
					expanded = "▾",
					collapsed = "▸",
					current_frame = "▸",
				},
				controls = {
					enabled = true,
				},
				floating = {
					border = "rounded",
				},
			})

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.fn.sign_define("DapBreakpoint", {
				text = "●",
				texthl = "DiagnosticError",
			})
			vim.fn.sign_define("DapBreakpointCondition", {
				text = "◆",
				texthl = "DiagnosticWarn",
			})
			vim.fn.sign_define("DapStopped", {
				text = "▶",
				texthl = "DiagnosticInfo",
				linehl = "Visual",
			})
			vim.fn.sign_define("DapLogPoint", {
				text = "◆",
				texthl = "DiagnosticInfo",
			})

			local debugpy_python = mason .. "/debugpy/venv/bin/python"
			local debugpy_adapter = vim.fn.stdpath("data") .. "/mason/bin/debugpy-adapter"

			if executable(debugpy_python) then
				require("dap-python").setup(debugpy_python)
			elseif executable(debugpy_adapter) then
				require("dap-python").setup(debugpy_adapter)
			else
				vim.notify(
					"debugpy no está instalado. Ejecuta :MasonToolsInstall",
					vim.log.levels.WARN
				)
			end

			local codelldb = mason .. "/codelldb/extension/adapter/codelldb"
			if not executable(codelldb) then
				codelldb = vim.fn.stdpath("data") .. "/mason/bin/codelldb"
			end

			if executable(codelldb) then
				dap.adapters.codelldb = {
					type = "server",
					port = "${port}",
					executable = {
						command = codelldb,
						args = { "--port", "${port}" },
					},
				}

				local configurations = {
					{
						name = "Ejecutar programa",
						type = "codelldb",
						request = "launch",
						program = function()
							return vim.fn.input(
								"Ejecutable: ",
								vim.fn.getcwd() .. "/",
								"file"
							)
						end,
						cwd = "${workspaceFolder}",
						stopOnEntry = false,
					},
					{
						name = "Adjuntar a proceso",
						type = "codelldb",
						request = "attach",
						pid = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
				}

				dap.configurations.c = configurations
				dap.configurations.cpp = configurations
			else
				vim.notify(
					"codelldb no está instalado. Ejecuta :MasonToolsInstall",
					vim.log.levels.WARN
				)
			end
		end,
	},
}

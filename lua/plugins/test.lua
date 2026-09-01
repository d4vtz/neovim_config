return {
	{
		"nvim-neotest/neotest",
		keys = {
			{
				"<leader>pn",
				function()
					require("neotest").run.run()
				end,
				desc = "Ejecutar prueba cercana",
			},
			{
				"<leader>pf",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Ejecutar archivo de pruebas",
			},
			{
				"<leader>pa",
				function()
					require("neotest").run.run(vim.uv.cwd())
				end,
				desc = "Ejecutar todas las pruebas",
			},
			{
				"<leader>pl",
				function()
					require("neotest").run.run_last()
				end,
				desc = "Repetir última prueba",
			},
			{
				"<leader>pd",
				function()
					require("neotest").run.run({ strategy = "dap" })
				end,
				desc = "Depurar prueba cercana",
			},
			{
				"<leader>ps",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Alternar resumen de pruebas",
			},
			{
				"<leader>po",
				function()
					require("neotest").output.open({
						enter = true,
						auto_close = true,
					})
				end,
				desc = "Mostrar salida de la prueba",
			},
			{
				"<leader>pO",
				function()
					require("neotest").output_panel.toggle()
				end,
				desc = "Alternar panel de salida",
			},
			{
				"<leader>px",
				function()
					require("neotest").run.stop()
				end,
				desc = "Detener prueba",
			},
		},

		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neotest/nvim-nio",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
			"mfussenegger/nvim-dap",
		},

		opts = function()
			return {
				adapters = {
					require("neotest-python")({
						runner = "pytest",
						dap = {
							justMyCode = false,
						},
						pytest_discover_instances = true,
					}),
				},
				discovery = {
					enabled = true,
					concurrent = 1,
				},
				output = {
					enabled = true,
					open_on_run = "short",
				},
				quickfix = {
					enabled = false,
				},
				status = {
					enabled = true,
					virtual_text = true,
					signs = true,
				},
				summary = {
					enabled = true,
					animated = true,
					follow = true,
				},
			}
		end,
	},
}

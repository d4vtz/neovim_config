return {
	{
		"folke/persistence.nvim",

		event = "BufReadPre",

		opts = {
			dir = vim.fn.stdpath("state") .. "/sessions/",
			need = 1,
			branch = true,
		},

		keys = {
			{
				"<leader>qs",
				function()
					require("persistence").load()
				end,
				desc = "Restaurar sesión",
			},

			{
				"<leader>ql",
				function()
					require("persistence").load({
						last = true,
					})
				end,
				desc = "Restaurar última sesión",
			},

			{
				"<leader>qd",
				function()
					require("persistence").stop()
				end,
				desc = "No guardar sesión",
			},
		},
	},
}

return {
	{
		"mfussenegger/nvim-lint",

		event = {
			"BufReadPre",
			"BufNewFile",
		},

		keys = {
			{
				"<leader>cl",
				function()
					require("lint").try_lint()
				end,
				desc = "Ejecutar linter",
			},
		},

		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				python = {
					"ruff",
				},
			}

			local group = vim.api.nvim_create_augroup("Lint", {
				clear = true,
			})

			vim.api.nvim_create_autocmd({
				"BufEnter",
				"BufWritePost",
				"InsertLeave",
			}, {
				group = group,

				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}

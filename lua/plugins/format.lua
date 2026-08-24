return {
	{
		"stevearc/conform.nvim",

		event = {
			"BufWritePre",
		},

		cmd = {
			"ConformInfo",
		},

		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({
						async = true,
						lsp_format = "fallback",
					})
				end,
				desc = "Formatear buffer",
			},
		},

		opts = {
			formatters_by_ft = {
				lua = {
					"stylua",
				},

				python = {
					"ruff_format",
				},

				c = {
					"clang_format",
				},

				cpp = {
					"clang_format",
				},

				tex = {
					"latexindent",
				},
			},
			formatters = {
				latexindent = {
					prepend_args = {
						"--cruft=Build",
					},
				},
			},

			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "fallback",
			},
		},
	},
}

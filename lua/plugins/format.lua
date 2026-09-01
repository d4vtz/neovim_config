local function format_buffer()
	if vim.b.bigfile then
		vim.notify("El formato está desactivado para archivos grandes", vim.log.levels.WARN)
		return
	end

	require("conform").format({
		async = true,
		lsp_format = "fallback",
	})
end

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
				"<leader>cf",
				format_buffer,
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

			format_on_save = function(buffer)
				if vim.b[buffer].bigfile then
					return
				end

				return {
					timeout_ms = 1000,
					lsp_format = "fallback",
				}
			end,
		},
	},
}

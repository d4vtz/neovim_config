return {
	{
		"folke/trouble.nvim",

		cmd = "Trouble",

		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		opts = {
			focus = true,
			auto_close = true,
			auto_preview = true,
			follow = true,
			restore = true,
			max_items = 200,
			multiline = true,
			warn_no_results = true,
			open_no_results = false,

			modes = {
				diagnostics = {
					win = {
						position = "bottom",
						size = 12,
					},
				},
				symbols = {
					focus = false,
					pinned = true,
					win = {
						position = "right",
						size = 0.3,
					},
				},
				lsp = {
					focus = false,
					win = {
						position = "right",
						size = 0.4,
					},
				},
			},
		},

		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<CR>",
				desc = "Diagnósticos",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
				desc = "Diagnósticos del buffer",
			},
			{
				"<leader>xe",
				"<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<CR>",
				desc = "Errores",
			},
			{
				"<leader>xs",
				"<cmd>Trouble symbols toggle<CR>",
				desc = "Símbolos",
			},
			{
				"<leader>xl",
				"<cmd>Trouble lsp toggle<CR>",
				desc = "Definiciones y referencias LSP",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<CR>",
				desc = "Quickfix",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<CR>",
				desc = "Location list",
			},
		},
	},
}

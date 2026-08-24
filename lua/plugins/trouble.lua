return {
	{
		"folke/trouble.nvim",

		cmd = "Trouble",

		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		opts = {
			focus = true,
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
				"<leader>xs",
				"<cmd>Trouble symbols toggle focus=false<CR>",
				desc = "Símbolos",
			},

			{
				"<leader>xl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
				desc = "LSP",
			},

			{
				"<leader>xq",
				"<cmd>Trouble qflist toggle<CR>",
				desc = "Quickfix",
			},

			{
				"<leader>xlc",
				"<cmd>Trouble loclist toggle<CR>",
				desc = "Location list",
			},
		},
	},
}

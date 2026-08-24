return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		cmd = {
			"ToggleTerm",
			"TermExec",
		},

		keys = {
			{
				"<C-\\>",
				"<cmd>ToggleTerm direction=float<CR>",
				desc = "Terminal flotante",
			},

			{
				"<leader>th",
				"<cmd>ToggleTerm direction=horizontal<CR>",
				desc = "Terminal horizontal",
			},

			{
				"<leader>tv",
				"<cmd>ToggleTerm direction=vertical<CR>",
				desc = "Terminal vertical",
			},
		},

		opts = {
			size = 15,

			open_mapping = [[<C-\>]],

			hide_numbers = true,

			shade_terminals = true,

			start_in_insert = true,

			insert_mappings = true,
			terminal_mappings = true,

			persist_size = true,
			persist_mode = true,

			direction = "float",

			close_on_exit = true,

			shell = vim.o.shell,

			float_opts = {
				border = "rounded",
				winblend = 0,
			},
		},
	},
}

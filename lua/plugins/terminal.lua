return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		cmd = {
			"ToggleTerm",
			"ToggleTermToggleAll",
			"TermExec",
			"TermSelect",
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
			{
				"<leader>ts",
				"<cmd>TermSelect<CR>",
				desc = "Seleccionar terminal",
			},
			{
				"<leader>ta",
				"<cmd>ToggleTermToggleAll<CR>",
				desc = "Mostrar u ocultar terminales",
			},
		},

		opts = {
			size = function(terminal)
				if terminal.direction == "horizontal" then
					return math.max(1, math.min(vim.o.lines - 4, math.max(12, math.floor(vim.o.lines * 0.3))))
				end

				if terminal.direction == "vertical" then
					return math.max(1, math.min(vim.o.columns - 4, math.max(40, math.floor(vim.o.columns * 0.4))))
				end
			end,

			open_mapping = [[<C-\>]],

			hide_numbers = true,
			autochdir = true,
			shade_terminals = true,
			start_in_insert = true,
			auto_scroll = true,

			insert_mappings = true,
			terminal_mappings = true,

			persist_size = true,
			persist_mode = true,

			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,

			float_opts = {
				border = "rounded",
				width = function()
					return math.max(1, math.min(vim.o.columns - 4, math.max(60, math.floor(vim.o.columns * 0.8))))
				end,
				height = function()
					return math.max(1, math.min(vim.o.lines - 4, math.max(15, math.floor(vim.o.lines * 0.8))))
				end,
				winblend = 0,
				title_pos = "center",
			},

			winbar = {
				enabled = true,
				name_formatter = function(terminal)
					return string.format(" Terminal %d: %s ", terminal.id, terminal.name or vim.o.shell)
				end,
			},

			responsiveness = {
				horizontal_breakpoint = 135,
			},
		},
	},
}

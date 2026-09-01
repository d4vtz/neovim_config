return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",

		opts = {
			enabled = function(buffer)
				return not vim.b[buffer].bigfile
			end,
			disable_filetype = {
				"TelescopePrompt",
				"snacks_dashboard",
				"snacks_picker_input",
			},
			disable_in_macro = true,
			disable_in_replace_mode = true,
			check_ts = true,
			map_cr = false,
		},
	},

	{
		"NMAC427/guess-indent.nvim",
		event = "BufReadPre",

		opts = {
			auto_cmd = true,
			override_editorconfig = false,
			filetype_exclude = {
				"help",
				"lazy",
				"mason",
				"snacks_dashboard",
			},
			buftype_exclude = {
				"help",
				"nofile",
				"terminal",
				"prompt",
			},
		},
	},

	{
		"folke/lazydev.nvim",
		ft = "lua",

		opts = {
			library = {
				{
					path = "${3rd}/luv/library",
					words = { "vim%.uv" },
				},
			},
		},
	},

	{
		"brenoprata10/nvim-highlight-colors",
		event = {
			"BufReadPost",
			"BufNewFile",
		},
		cmd = "HighlightColors",

		opts = {
			render = "virtual",
			virtual_symbol = "■",
			virtual_symbol_position = "eow",
			virtual_symbol_prefix = " ",
			virtual_symbol_suffix = "",

			enable_hex = true,
			enable_short_hex = true,
			enable_rgb = true,
			enable_hsl = true,
			enable_named_colors = false,
			enable_tailwind = false,

			exclude_filetypes = {
				"help",
				"lazy",
				"mason",
				"snacks_dashboard",
			},
			exclude_buftypes = {
				"nofile",
				"prompt",
				"terminal",
			},
			exclude_buffer = function(buffer)
				return vim.b[buffer].bigfile == true
			end,
		},
	},
}

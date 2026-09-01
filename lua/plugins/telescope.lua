return {
	{
		"nvim-telescope/telescope.nvim",

		dependencies = {
			"nvim-lua/plenary.nvim",

			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},

		cmd = "Telescope",

		keys = {
			{
				"<leader>ff",
				"<cmd>Telescope find_files<CR>",
				desc = "Buscar archivos",
			},
			{
				"<leader>fg",
				"<cmd>Telescope live_grep<CR>",
				desc = "Buscar texto",
			},
			{
				"<leader>fb",
				"<cmd>Telescope buffers<CR>",
				desc = "Buscar buffers",
			},
			{
				"<leader>fh",
				"<cmd>Telescope help_tags<CR>",
				desc = "Buscar ayuda",
			},
			{
				"<leader>fr",
				"<cmd>Telescope oldfiles<CR>",
				desc = "Archivos recientes",
			},
			{
				"<leader>fw",
				"<cmd>Telescope grep_string<CR>",
				desc = "Buscar palabra bajo el cursor",
			},
			{
				"<leader>fd",
				"<cmd>Telescope diagnostics<CR>",
				desc = "Buscar diagnósticos",
			},
			{
				"<leader>fR",
				"<cmd>Telescope resume<CR>",
				desc = "Reanudar última búsqueda",
			},
		},

		opts = {
			defaults = {
				prompt_prefix = "  ",
				selection_caret = "➜ ",
				path_display = { "smart" },

				sorting_strategy = "ascending",

				layout_strategy = "horizontal",

				layout_config = {
					prompt_position = "top",

					horizontal = {
						preview_width = 0.55,
					},
				},

				file_ignore_patterns = {
					"%.git/",
					"node_modules/",
				},
			},

			pickers = {
				find_files = {
					hidden = true,
				},
			},

			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		},

		config = function(_, opts)
			local telescope = require("telescope")

			telescope.setup(opts)

			pcall(telescope.load_extension, "fzf")
		end,
	},
}

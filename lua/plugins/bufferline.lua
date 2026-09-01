return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",

		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		keys = {
			{ "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Buffer anterior" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Buffer siguiente" },
			{ "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Elegir buffer" },
			{ "<leader>bd", "<cmd>bdelete<CR>", desc = "Cerrar buffer" },
		},

		opts = {
			options = {
				mode = "buffers",
				numbers = "none",

				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",

				left_trunc_marker = "",
				right_trunc_marker = "",

				max_name_length = 18,
				max_prefix_length = 15,

				tab_size = 18,

				diagnostics = "nvim_lsp",

				diagnostics_update_in_insert = false,

				color_icons = true,

				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = false,

				separator_style = "thin",

				always_show_bufferline = true,

				persist_buffer_sort = true,

				sort_by = "insert_after_current",
				offsets = {
					{
						filetype = "neo-tree",
						text = "Explorer",
						highlight = "Directory",
						separator = true,
					},
				},
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
			},
		},
	},
}

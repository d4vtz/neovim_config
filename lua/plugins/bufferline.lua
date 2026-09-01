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
			{ "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", desc = "Cerrar otros buffers" },
			{ "<leader>br", "<cmd>BufferLineCloseRight<CR>", desc = "Cerrar buffers a la derecha" },
			{ "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", desc = "Cerrar buffers a la izquierda" },
		},

		opts = {
			options = {
				mode = "buffers",
				numbers = "none",

				close_command = function(buffer)
					vim.api.nvim_buf_delete(buffer, { force = false })
				end,
				right_mouse_command = function(buffer)
					vim.api.nvim_buf_delete(buffer, { force = false })
				end,

				left_trunc_marker = "",
				right_trunc_marker = "",

				max_name_length = 18,
				max_prefix_length = 15,

				tab_size = 18,

				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " "
						or level:match("warning") and " "
						or " "
					return " " .. icon .. count
				end,

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

local function confirm_reset(message)
	return vim.fn.confirm(message, "&Sí\n&No", 2) == 1
end

return {
	{
		"lewis6991/gitsigns.nvim",
		event = {
			"BufReadPre",
			"BufNewFile",
		},

		opts = {
			signs = {
				add = {
					text = "┃",
				},
				change = {
					text = "┃",
				},
				delete = {
					text = "_",
				},
				topdelete = {
					text = "‾",
				},
				changedelete = {
					text = "~",
				},
				untracked = {
					text = "┆",
				},
			},

			signs_staged = {
				add = {
					text = "┋",
				},
				change = {
					text = "┋",
				},
				delete = {
					text = "▁",
				},
				topdelete = {
					text = "▔",
				},
				changedelete = {
					text = "≋",
				},
				untracked = {
					text = "┊",
				},
			},

			signcolumn = true,
			numhl = false,
			linehl = false,
			word_diff = false,

			current_line_blame = false,
			current_line_blame_opts = {
				delay = 500,
				virt_text_pos = "eol",
				ignore_whitespace = true,
			},

			preview_config = {
				border = "rounded",
			},

			update_debounce = 100,
			max_file_length = 40000,

			on_attach = function(buffer)
				local gs = require("gitsigns")

				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, {
						buffer = buffer,
						desc = desc,
					})
				end

				map("n", "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
						return
					end

					gs.nav_hunk("next")
				end, "Siguiente hunk")

				map("n", "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
						return
					end

					gs.nav_hunk("prev")
				end, "Hunk anterior")

				map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
				map("n", "<leader>hu", gs.undo_stage_hunk, "Deshacer stage del hunk")

				map("v", "<leader>hs", function()
					gs.stage_hunk({
						vim.fn.line("."),
						vim.fn.line("v"),
					})
				end, "Stage hunk")

				map("n", "<leader>hr", function()
					if confirm_reset("¿Descartar los cambios de este hunk?") then
						gs.reset_hunk()
					end
				end, "Descartar hunk")

				map("v", "<leader>hr", function()
					if confirm_reset("¿Descartar los cambios seleccionados?") then
						gs.reset_hunk({
							vim.fn.line("."),
							vim.fn.line("v"),
						})
					end
				end, "Descartar hunk")

				map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
				map("n", "<leader>hR", function()
					if confirm_reset("¿Descartar todos los cambios del buffer?") then
						gs.reset_buffer()
					end
				end, "Descartar cambios del buffer")

				map("n", "<leader>hp", gs.preview_hunk, "Previsualizar hunk")
				map("n", "<leader>hi", gs.preview_hunk_inline, "Previsualizar hunk inline")

				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, "Git blame de la línea")

				map("n", "<leader>hB", gs.toggle_current_line_blame, "Alternar blame de línea")
				map("n", "<leader>ht", gs.toggle_deleted, "Alternar líneas eliminadas")

				map("n", "<leader>hd", gs.diffthis, "Diff contra el índice")
				map("n", "<leader>hD", function()
					gs.diffthis("HEAD")
				end, "Diff contra HEAD")

				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Seleccionar hunk")
			end,
		},
	},
}

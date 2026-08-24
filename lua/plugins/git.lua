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

			signcolumn = true,
			numhl = false,
			linehl = false,
			word_diff = false,

			current_line_blame = false,

			preview_config = {
				border = "rounded",
			},

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
				map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")

				map("v", "<leader>hs", function()
					gs.stage_hunk({
						vim.fn.line("."),
						vim.fn.line("v"),
					})
				end, "Stage hunk")

				map("v", "<leader>hr", function()
					gs.reset_hunk({
						vim.fn.line("."),
						vim.fn.line("v"),
					})
				end, "Reset hunk")

				map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
				map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

				map("n", "<leader>hp", gs.preview_hunk, "Previsualizar hunk")
				map("n", "<leader>hi", gs.preview_hunk_inline, "Preview inline")

				map("n", "<leader>hb", function()
					gs.blame_line({
						full = true,
					})
				end, "Git blame")

				map("n", "<leader>hd", gs.diffthis, "Git diff")

				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, "Git diff HEAD")

				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Seleccionar hunk")
			end,
		},
	},
}

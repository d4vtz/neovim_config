return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",

		init = function()
			local group = vim.api.nvim_create_augroup("UserNeoTreeStartup", {
				clear = true,
			})

			vim.api.nvim_create_autocmd("BufEnter", {
				group = group,
				once = true,
				callback = function(args)
					local path = vim.api.nvim_buf_get_name(args.buf)
					local stat = vim.uv.fs_stat(path)

					if stat and stat.type == "directory" then
						vim.schedule(function()
							vim.cmd("Neotree current dir=" .. vim.fn.fnameescape(path))
						end)
					end
				end,
			})
		end,

		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},

		cmd = "Neotree",

		keys = {
			{
				"<leader>ee",
				"<cmd>Neotree toggle<CR>",
				desc = "Alternar explorador",
			},
			{
				"<leader>er",
				"<cmd>Neotree reveal<CR>",
				desc = "Revelar archivo actual",
			},
		},

		opts = {
			close_if_last_window = true,

			open_files_do_not_replace_types = {
				"terminal",
				"trouble",
				"qf",
			},

			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = true,
					never_show = {
						".git",
					},
				},

				hijack_netrw_behavior = "open_default",
				follow_current_file = {
					enabled = true,
				},

				use_libuv_file_watcher = true,
			},

			window = {
				width = 32,
			},
		},
	},
}

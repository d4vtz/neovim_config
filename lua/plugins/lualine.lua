return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",

		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		opts = {
			options = {
				theme = "auto",
				globalstatus = true,
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "starter", "neo-tree" },
				},
				component_separators = {
					left = "│",
					right = "│",
				},
				section_separators = {
					left = "",
					right = "",
				},
			},

			sections = {
				lualine_a = {
					"mode",
				},

				lualine_b = {
					"branch",
					"diff",
					"diagnostics",
				},

				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "[Sin nombre]",
							newfile = "[Nuevo]",
						},
					},
				},

				lualine_x = {
					{
						function()
							local clients = vim.lsp.get_clients({ bufnr = 0 })
							if #clients == 0 then
								return ""
							end

							local names = {}
							for _, client in ipairs(clients) do
								names[#names + 1] = client.name
							end

							return "  " .. table.concat(names, ", ")
						end,
						cond = function()
							return vim.bo.filetype ~= ""
						end,
					},
					{
						"encoding",
						cond = function()
							return vim.bo.fileencoding ~= "" and vim.bo.fileencoding ~= "utf-8"
						end,
					},
					{
						"fileformat",
						cond = function()
							return vim.bo.fileformat ~= "unix"
						end,
					},
					"filetype",
				},

				lualine_y = {
					"progress",
				},

				lualine_z = {
					"location",
				},
			},
		},
	},
}

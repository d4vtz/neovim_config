return {
	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		lazy = false,
		priority = 1000,

		opts = {
			show_end_of_buffer = false,
			transparent_bg = false,
			lualine_bg_color = "#282A36",
			italic_comment = true,

			overrides = function(colors)
				return {
					FloatBorder = {
						fg = colors.purple,
						bg = colors.menu,
					},
					WinSeparator = {
						fg = colors.selection,
					},
				}
			end,
		},

		config = function(_, opts)
			require("dracula").setup(opts)
			vim.cmd.colorscheme("dracula")
		end,
	},
}

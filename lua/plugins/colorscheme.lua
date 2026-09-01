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
					SnacksDashboardHeader = {
						fg = colors.purple,
						bold = true,
					},
					SnacksDashboardIcon = {
						fg = colors.cyan,
					},
					SnacksDashboardKey = {
						fg = colors.pink,
					},
					SnacksDashboardDesc = {
						fg = colors.fg,
					},
					SnacksDashboardDir = {
						fg = colors.cyan,
					},
					SnacksDashboardFile = {
						fg = colors.fg,
						bold = true,
					},
					SnacksDashboardTitle = {
						fg = colors.cyan,
						bold = true,
					},
					SnacksDashboardFooter = {
						fg = colors.orange,
						italic = true,
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

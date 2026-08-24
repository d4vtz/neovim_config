return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",

		opts = {
			preset = "modern",

			delay = 300,

			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "+",
			},

			win = {
				border = "rounded",
			},

			spec = {
				{ "<leader>b", group = "Buffers" },
				{ "<leader>c", group = "Código" },
				{ "<leader>f", group = "Buscar / Formato" },
				{ "<leader>h", group = "Git hunks" },
				{ "<leader>r", group = "Refactor / Config" },
				{ "<leader>t", group = "Terminal" },
				{ "<leader>q", group = "Sesión" },
				{ "<leader>l", group = "LaTeX" },
				{ "<leader>x", group = "Trouble" },
			},
		},
	},
}

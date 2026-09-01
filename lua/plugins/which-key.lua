return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",

		opts = {
			preset = "modern",
			delay = 250,
			expand = 1,

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
				{ "<leader>d", group = "Símbolos y tipos" },
				{ "<leader>e", group = "Explorador" },
				{ "<leader>f", group = "Buscar" },
				{ "<leader>h", group = "Cambios Git" },
				{ "<leader>l", group = "LaTeX" },
				{ "<leader>n", group = "Notificaciones" },
				{ "<leader>q", group = "Salir y sesiones" },
				{ "<leader>r", group = "Refactor y configuración" },
				{ "<leader>s", group = "Intercambiar" },
				{ "<leader>t", group = "Terminal" },
				{ "<leader>x", group = "Diagnósticos" },
			},
		},
	},
}

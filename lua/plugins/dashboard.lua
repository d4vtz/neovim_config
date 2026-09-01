local header = [[
                         .       *       .
                  *          .       .
                       _______________
                _.--''      _____      ''--._
             .-'        .-''     ''-.        '-.
        ==== / ========/    ███    \======== \ ====
             \        \    ███    /        /
              '-._       '-._____.-'       _.-'
                   ''--.._________..--''

                    G  A  R  G  A  N  T  U  A
]]

return {
	{
		"folke/snacks.nvim",
		priority = 900,
		lazy = false,

		opts = {
			dashboard = {
				enabled = true,
				width = 64,

				preset = {
					header = header,
					keys = {
						{
							icon = " ",
							key = "f",
							desc = "Buscar archivo",
							action = ":Telescope find_files",
						},
						{
							icon = " ",
							key = "g",
							desc = "Buscar texto",
							action = ":Telescope live_grep",
						},
						{
							icon = " ",
							key = "r",
							desc = "Archivos recientes",
							action = ":Telescope oldfiles",
						},
						{
							icon = " ",
							key = "n",
							desc = "Archivo nuevo",
							action = ":ene | startinsert",
						},
						{
							icon = " ",
							key = "s",
							desc = "Restaurar sesión",
							action = function()
								require("persistence").load()
							end,
						},
						{
							icon = " ",
							key = "c",
							desc = "Configuración",
							action = function()
								require("telescope.builtin").find_files({
									cwd = vim.fn.stdpath("config"),
								})
							end,
						},
						{
							icon = "󰒲 ",
							key = "l",
							desc = "Lazy",
							action = ":Lazy",
						},
						{
							icon = " ",
							key = "q",
							desc = "Salir",
							action = ":qa",
						},
					},
				},

				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{
						icon = " ",
						title = "Recientes",
						section = "recent_files",
						limit = 5,
						indent = 2,
						padding = 1,
					},
					{ section = "startup" },
				},
			},
		},
	},
}

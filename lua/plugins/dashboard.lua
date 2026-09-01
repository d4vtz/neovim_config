local header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

local quotes = {
	{
		text = "La naturaleza está escrita en lenguaje matemático.",
		author = "Galileo Galilei",
	},
	{
		text = "Lo que no puedo crear, no lo entiendo.",
		author = "Richard Feynman",
	},
	{
		text = "Las matemáticas son la música de la razón.",
		author = "James Joseph Sylvester",
	},
	{
		text = "Enseñar no es transferir conocimiento, sino crear posibilidades para producirlo.",
		author = "Paulo Freire",
	},
	{
		text = "Si he visto más lejos es porque estoy sobre hombros de gigantes.",
		author = "Isaac Newton",
	},
	{
		text = "El arte de enseñar es el arte de ayudar a descubrir.",
		author = "Mark Van Doren",
	},
	{
		text = "Un maestro afecta la eternidad; nunca sabe dónde termina su influencia.",
		author = "Henry Adams",
	},
	{
		text = "La ciencia es una forma de pensar, mucho más que un cuerpo de conocimientos.",
		author = "Carl Sagan",
	},
}

local function quote_section()
	local index = tonumber(vim.uv.hrtime() % #quotes) + 1
	local quote = quotes[index]

	return {
		{
			text = {
				{
					"“" .. quote.text .. "”",
					hl = "footer",
					align = "center",
				},
			},
			padding = { 2, 0 },
		},
		{
			text = {
				{
					"— " .. quote.author,
					hl = "footer",
					align = "center",
				},
			},
		},
	}
end

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
					quote_section,
				},
			},
		},
	},
}

return {
	{
		"rcarriga/nvim-notify",

		lazy = false,

		keys = {
			{
				"<leader>nd",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Descartar notificaciones",
			},
			{
				"<leader>nh",
				"<cmd>Notifications<CR>",
				desc = "Historial de notificaciones",
			},
		},

		opts = {
			stages = "fade_in_slide_out",
			timeout = 2000,
			background_colour = "#000000",
			render = "compact",
			top_down = false,
			max_width = function()
				return math.min(80, math.floor(vim.o.columns * 0.5))
			end,
			max_height = function()
				return math.min(15, math.floor(vim.o.lines * 0.4))
			end,
		},

		config = function(_, opts)
			local notify = require("notify")

			notify.setup(opts)

			vim.notify = function(message, level, notify_opts)
				local options = vim.tbl_extend("force", {}, notify_opts or {})

				if options.timeout == nil then
					if level == vim.log.levels.ERROR then
						options.timeout = 5000
					elseif level == vim.log.levels.WARN then
						options.timeout = 3500
					else
						options.timeout = 2000
					end
				end

				return notify(message, level, options)
			end
		end,
	},
}

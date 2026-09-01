local function can_restore()
	for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buffer) and vim.bo[buffer].modified then
			vim.notify(
				"Hay cambios sin guardar; guarda o descarta los cambios antes de restaurar una sesión",
				vim.log.levels.WARN
			)
			return false
		end
	end

	return true
end

local function restore(opts)
	if not can_restore() then
		return
	end

	require("persistence").load(opts)
end

return {
	{
		"folke/persistence.nvim",

		event = "BufReadPre",

		init = function()
			vim.opt.sessionoptions = {
				"buffers",
				"curdir",
				"folds",
				"help",
				"tabpages",
				"winsize",
				"winpos",
				"localoptions",
			}
		end,

		opts = {
			dir = vim.fn.stdpath("state") .. "/sessions/",
			need = 1,
			branch = true,
		},

		keys = {
			{
				"<leader>qs",
				function()
					restore()
				end,
				desc = "Restaurar sesión",
			},
			{
				"<leader>qS",
				function()
					if can_restore() then
						require("persistence").select()
					end
				end,
				desc = "Seleccionar sesión",
			},
			{
				"<leader>ql",
				function()
					restore({ last = true })
				end,
				desc = "Restaurar última sesión",
			},
			{
				"<leader>qd",
				function()
					require("persistence").stop()
					vim.notify("Guardado automático de sesión desactivado", vim.log.levels.INFO)
				end,
				desc = "No guardar sesión",
			},
		},

		config = function(_, opts)
			local persistence = require("persistence")
			persistence.setup(opts)

			local group = vim.api.nvim_create_augroup("UserPersistence", { clear = true })
			vim.api.nvim_create_autocmd("User", {
				group = group,
				pattern = "PersistenceLoadPost",
				callback = function()
					vim.notify("Sesión restaurada", vim.log.levels.INFO)
				end,
			})
		end,
	},
}

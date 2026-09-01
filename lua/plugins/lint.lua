local function available_linters()
	local lint = require("lint")
	local configured = lint.linters_by_ft[vim.bo.filetype] or {}
	local available = {}

	for _, name in ipairs(configured) do
		local linter = lint.linters[name]
		local command = linter and linter.cmd
		command = type(command) == "function" and command() or command

		if type(command) == "string" and vim.fn.executable(command) == 1 then
			available[#available + 1] = name
		end
	end

	return configured, available
end

local function lint_buffer(notify_missing)
	if vim.bo.buftype ~= "" or vim.b.bigfile then
		return
	end

	local configured, available = available_linters()

	if #available > 0 then
		require("lint").try_lint(available)
		return
	end

	if notify_missing then
		if #configured == 0 then
			vim.notify("No hay linters configurados para este tipo de archivo", vim.log.levels.INFO)
		else
			vim.notify(
				"No están disponibles los linters configurados: " .. table.concat(configured, ", "),
				vim.log.levels.WARN
			)
		end
	end
end

return {
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPost",
			"BufNewFile",
		},

		keys = {
			{
				"<leader>cl",
				function()
					lint_buffer(true)
				end,
				desc = "Ejecutar linter",
			},
		},

		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				bash = { "shellcheck" },
				sh = { "shellcheck" },
				tex = { "chktex" },
				plaintex = { "chktex" },
			}

			local group = vim.api.nvim_create_augroup("UserLint", { clear = true })
			vim.api.nvim_create_autocmd("BufWritePost", {
				group = group,
				callback = function()
					lint_buffer(false)
				end,
			})

			vim.schedule(function()
				if vim.api.nvim_buf_is_valid(0) and vim.api.nvim_buf_get_name(0) ~= "" then
					lint_buffer(false)
				end
			end)
		end,
	},
}

local group = vim.api.nvim_create_augroup("UserConfig", {
	clear = true,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_user_command("ReloadConfig", function()
	require("config.reload").config()
end, {})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = group,
	pattern = vim.fn.stdpath("config") .. "/lua/config/*.lua",
	callback = function(args)
		local file = vim.fn.fnamemodify(args.file, ":p")

		local config_dir = vim.fn.stdpath("config") .. "/lua/"
		local module = file:sub(#config_dir + 1):gsub("%.lua$", ""):gsub("/", ".")

		require("config.reload").module(module)

		vim.notify(string.format("Recargado: %s", module), vim.log.levels.INFO)
	end,
})

vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,

	underline = true,

	virtual_text = {
		spacing = 2,
		source = "if_many",
		prefix = "●",
	},

	float = {
		border = "rounded",
		source = true,
	},

	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	},
})

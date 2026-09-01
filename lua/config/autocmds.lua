local group = vim.api.nvim_create_augroup("UserConfig", {
	clear = true,
})

local bigfile_size = 2 * 1024 * 1024

vim.api.nvim_create_autocmd("BufReadPre", {
	group = group,
	callback = function(args)
		local path = vim.api.nvim_buf_get_name(args.buf)
		local stat = path ~= "" and vim.uv.fs_stat(path) or nil

		if stat and stat.size > bigfile_size then
			vim.b[args.buf].bigfile = true
			vim.bo[args.buf].swapfile = false
			vim.bo[args.buf].undofile = false

			vim.schedule(function()
				vim.notify(
					"Modo de archivo grande: Treesitter, LSP y lint desactivados",
					vim.log.levels.INFO
				)
			end)
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = group,
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)

		if mark[1] > 0 and mark[1] <= line_count then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = group,
	callback = function()
		if vim.fn.getcmdwintype() == "" then
			vim.cmd("checktime")
		end
	end,
})

vim.api.nvim_create_autocmd("VimResized", {
	group = group,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = group,
	callback = function(args)
		if vim.bo[args.buf].buftype ~= "" then
			return
		end

		local path = vim.api.nvim_buf_get_name(args.buf)
		if path == "" or path:match("^%w+://") then
			return
		end

		vim.fn.mkdir(vim.fn.fnamemodify(path, ":p:h"), "p")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = {
		"checkhealth",
		"help",
		"lspinfo",
		"man",
		"qf",
		"startuptime",
	},
	callback = function(args)
		vim.keymap.set("n", "q", "<cmd>close<CR>", {
			buffer = args.buf,
			silent = true,
			desc = "Cerrar ventana",
		})
	end,
})

vim.api.nvim_create_user_command("TrimWhitespace", function()
	local view = vim.fn.winsaveview()
	vim.cmd([[%s/\s\+$//e]])
	vim.fn.winrestview(view)
end, {
	desc = "Eliminar espacios al final de línea",
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

local parsers = {
	"bash",
	"c",
	"cpp",
	"json",
	"latex",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"toml",
	"vim",
	"vimdoc",
	"yaml",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",

		config = function()
			local treesitter = require("nvim-treesitter")

			treesitter.setup()
			treesitter.install(parsers)

			local group = vim.api.nvim_create_augroup("UserTreesitter", {
				clear = true,
			})

			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				callback = function(args)
					if not vim.b[args.buf].bigfile then
						pcall(vim.treesitter.start)
					end
				end,
			})
		end,
	},
}

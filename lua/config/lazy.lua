local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local output = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})

	if vim.v.shell_error ~= 0 then
		error("No se pudo instalar lazy.nvim:\n" .. output)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			import = "plugins",
		},
	},

	defaults = {
		lazy = false,
	},

	rocks = {
		enabled = false,
	},

	install = {
		colorscheme = { "dracula", "habamax" },
	},

	checker = {
		enabled = false,
	},

	change_detection = {
		notify = false,
	},
})

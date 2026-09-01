vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.breakindent = true
opt.wrap = false

opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

opt.termguicolors = true
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.pumheight = 12

opt.updatetime = 250
opt.timeoutlen = 500

opt.mouse = "a"
opt.clipboard = "unnamedplus"

opt.confirm = true
opt.autoread = true
opt.hidden = true

opt.undofile = true
opt.undolevels = 10000
opt.swapfile = true
opt.backup = false
opt.writebackup = true

opt.list = true
opt.listchars = {
	tab = "→ ",
	trail = "·",
	nbsp = "␣",
}

opt.laststatus = 3
opt.showmode = false
opt.shortmess:append({
	I = true,
	c = true,
})

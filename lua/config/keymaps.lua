vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<C-Up>", "<cmd>resize +2<CR>")
map("n", "<C-Down>", "<cmd>resize -2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

map("n", "<leader>w", "<cmd>write<CR>", {
	desc = "Guardar archivo",
})
map("n", "<leader>qq", "<cmd>quit<CR>", {
	desc = "Salir",
})
map("n", "<leader>qw", "<cmd>x<CR>", {
	desc = "Guardar y salir",
})

map("n", "<leader>rc", "<cmd>ReloadConfig<CR>", {
	desc = "Recargar configuración",
})

map("t", "<Esc><Esc>", [[<C-\><C-n>]], {
	desc = "Salir del modo terminal",
})
map("t", "<C-h>", [[<C-\><C-n><C-w>h]], {
	desc = "Mover a ventana izquierda",
})
map("t", "<C-j>", [[<C-\><C-n><C-w>j]], {
	desc = "Mover a ventana inferior",
})
map("t", "<C-k>", [[<C-\><C-n><C-w>k]], {
	desc = "Mover a ventana superior",
})
map("t", "<C-l>", [[<C-\><C-n><C-w>l]], {
	desc = "Mover a ventana derecha",
})

local lsp_group = vim.api.nvim_create_augroup("UserLspConfig", {
	clear = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_group,

	callback = function(event)
		local function lsp_map(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, {
				buffer = event.buf,
				desc = desc,
			})
		end
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if client and client.name == "texlab" then
			lsp_map("<leader>lb", "<cmd>LspTexlabBuild<CR>", "Compilar LaTeX")
			lsp_map("<leader>lv", "<cmd>LspTexlabForward<CR>", "Forward search")
			lsp_map("<leader>lc", "<cmd>LspTexlabCancelBuild<CR>", "Cancelar compilación")
			lsp_map("<leader>la", "<cmd>LspTexlabChangeEnvironment<CR>", "Cambiar entorno")
			lsp_map("<leader>lf", "<cmd>LspTexlabFindEnvironments<CR>", "Buscar entorno")
			lsp_map("<leader>lk", "<cmd>LspTexlabCleanArtifacts<CR>", "Limpiar archivos auxiliares")
			lsp_map("<leader>lK", "<cmd>LspTexlabCleanAuxiliary<CR>", "Limpiar archivos auxiliares adicionales")
		end

		lsp_map("gd", function()
			require("telescope.builtin").lsp_definitions()
		end, "Ir a definición")

		lsp_map("gr", function()
			require("telescope.builtin").lsp_references()
		end, "Ver referencias")

		lsp_map("gi", function()
			require("telescope.builtin").lsp_implementations()
		end, "Ir a implementación")

		lsp_map("gD", vim.lsp.buf.declaration, "Ir a declaración")

		lsp_map("<leader>dt", function()
			require("telescope.builtin").lsp_type_definitions()
		end, "Definición de tipo")

		lsp_map("K", vim.lsp.buf.hover, "Mostrar documentación")

		lsp_map("<leader>rn", vim.lsp.buf.rename, "Renombrar")
		lsp_map("<leader>ca", vim.lsp.buf.code_action, "Acciones de código")

		lsp_map("<leader>ds", function()
			require("telescope.builtin").lsp_document_symbols()
		end, "Símbolos del documento")

		lsp_map("<leader>dS", function()
			require("telescope.builtin").lsp_dynamic_workspace_symbols()
		end, "Símbolos del workspace")

		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({
				count = -1,
				float = true,
			})
		end, {
			buffer = event.buf,
			desc = "Diagnóstico anterior",
		})

		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({
				count = 1,
				float = true,
			})
		end, {
			buffer = event.buf,
			desc = "Diagnóstico siguiente",
		})

		vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, {
			buffer = event.buf,
			desc = "Mostrar diagnóstico",
		})
	end,
})

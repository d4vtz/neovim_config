return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },

		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},

		opts = {
			ensure_installed = {
				"lua_ls",
				"basedpyright",
				"ruff",
				"clangd",
				"bashls",
				"texlab",
			},
			automatic_enable = {
				"lua_ls",
				"basedpyright",
				"ruff",
				"clangd",
				"bashls",
				"texlab",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },

		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			vim.lsp.config("*", {
				capabilities = capabilities,
			})
			vim.lsp.config("basedpyright", {
				settings = {
					basedpyright = {
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = "openFilesOnly",
							useLibraryCodeForTypes = true,

							typeCheckingMode = "standard",

							inlayHints = {
								variableTypes = true,
								callArgumentNames = true,
								functionReturnTypes = true,
								genericTypes = true,
							},
						},

						disableTaggedHints = false,
					},
				},
			})
			vim.lsp.config("texlab", {
				settings = {
					texlab = {
						auxDirectory = "Build",

						build = {
							executable = "latexmk",
							args = {
								"-pdf",
								"-interaction=nonstopmode",
								"-synctex=1",
								"-outdir=Build",
								"%f",
							},

							onSave = true,
							forwardSearchAfter = false,
						},

						forwardSearch = {
							executable = "zathura",
							args = {
								"--synctex-forward",
								"%l:1:%f",
								"%p",
							},
						},

						chktex = {
							onOpenAndSave = false,
							onEdit = false,
						},

						latexFormatter = "latexindent",

						latexindent = {
							modifyLineBreaks = false,
						},
					},
				},
			})
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = {
								"vim",
							},
						},

						workspace = {
							checkThirdParty = false,
						},

						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})

		end,
	},
}

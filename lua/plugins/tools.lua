return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = true,

		cmd = {
			"MasonToolsInstall",
			"MasonToolsInstallSync",
			"MasonToolsUpdate",
			"MasonToolsUpdateSync",
			"MasonToolsClean",
		},

		init = function()
			vim.defer_fn(function()
				if #vim.api.nvim_list_uis() == 0 then
					return
				end

				require("lazy").load({
					plugins = {
						"mason-tool-installer.nvim",
					},
				})
			end, 3000)
		end,

		dependencies = {
			"mason-org/mason.nvim",
		},

		opts = {
			ensure_installed = {
				"lua-language-server",
				"basedpyright",
				"ruff",
				"clangd",
				"bash-language-server",
				"texlab",
				"stylua",
				"clang-format",
				"shellcheck",
				"chktex",
			},

			auto_update = false,
			run_on_start = true,
			start_delay = 0,
			debounce_hours = 168,

			integrations = {
				["mason-lspconfig"] = false,
				["mason-null-ls"] = false,
				["mason-nvim-dap"] = false,
			},
		},
	},
}

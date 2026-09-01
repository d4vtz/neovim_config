local function available()
	if vim.b.bigfile then
		vim.notify("Los textobjects están desactivados para archivos grandes", vim.log.levels.WARN)
		return false
	end

	return true
end

return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		event = {
			"BufReadPost",
			"BufNewFile",
		},

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},

		opts = {
			select = {
				lookahead = true,
				selection_modes = {
					["@parameter.outer"] = "v",
					["@function.outer"] = "V",
					["@class.outer"] = "V",
				},
				include_surrounding_whitespace = false,
			},
			move = {
				set_jumps = true,
			},
		},

		config = function(_, opts)
			require("nvim-treesitter-textobjects").setup(opts)
		end,

		keys = {
			{
				"af",
				function()
					if available() then
						require("nvim-treesitter-textobjects.select").select_textobject(
							"@function.outer",
							"textobjects"
						)
					end
				end,
				mode = { "x", "o" },
				desc = "Alrededor de función",
			},
			{
				"if",
				function()
					if available() then
						require("nvim-treesitter-textobjects.select").select_textobject(
							"@function.inner",
							"textobjects"
						)
					end
				end,
				mode = { "x", "o" },
				desc = "Interior de función",
			},
			{
				"ac",
				function()
					if available() then
						require("nvim-treesitter-textobjects.select").select_textobject(
							"@class.outer",
							"textobjects"
						)
					end
				end,
				mode = { "x", "o" },
				desc = "Alrededor de clase",
			},
			{
				"ic",
				function()
					if available() then
						require("nvim-treesitter-textobjects.select").select_textobject(
							"@class.inner",
							"textobjects"
						)
					end
				end,
				mode = { "x", "o" },
				desc = "Interior de clase",
			},
			{
				"aa",
				function()
					if available() then
						require("nvim-treesitter-textobjects.select").select_textobject(
							"@parameter.outer",
							"textobjects"
						)
					end
				end,
				mode = { "x", "o" },
				desc = "Alrededor de argumento",
			},
			{
				"ia",
				function()
					if available() then
						require("nvim-treesitter-textobjects.select").select_textobject(
							"@parameter.inner",
							"textobjects"
						)
					end
				end,
				mode = { "x", "o" },
				desc = "Interior de argumento",
			},
			{
				"]f",
				function()
					if available() then
						require("nvim-treesitter-textobjects.move").goto_next_start(
							"@function.outer",
							"textobjects"
						)
					end
				end,
				mode = { "n", "x", "o" },
				desc = "Siguiente función",
			},
			{
				"[f",
				function()
					if available() then
						require("nvim-treesitter-textobjects.move").goto_previous_start(
							"@function.outer",
							"textobjects"
						)
					end
				end,
				mode = { "n", "x", "o" },
				desc = "Función anterior",
			},
			{
				"]F",
				function()
					if available() then
						require("nvim-treesitter-textobjects.move").goto_next_start(
							"@class.outer",
							"textobjects"
						)
					end
				end,
				mode = { "n", "x", "o" },
				desc = "Siguiente clase",
			},
			{
				"[F",
				function()
					if available() then
						require("nvim-treesitter-textobjects.move").goto_previous_start(
							"@class.outer",
							"textobjects"
						)
					end
				end,
				mode = { "n", "x", "o" },
				desc = "Clase anterior",
			},
			{
				"<leader>sn",
				function()
					if available() then
						require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
					end
				end,
				desc = "Intercambiar con argumento siguiente",
			},
			{
				"<leader>sp",
				function()
					if available() then
						require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
					end
				end,
				desc = "Intercambiar con argumento anterior",
			},
		},
	},
}

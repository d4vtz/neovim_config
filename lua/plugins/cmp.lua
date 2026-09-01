return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		event = "InsertEnter",

		dependencies = {
			"rafamadriz/friendly-snippets",
		},

		opts = {
			enabled = function()
				return not vim.b.bigfile
			end,

			keymap = {
				preset = "none",

				["<C-space>"] = {
					"show",
					"show_documentation",
					"hide_documentation",
				},

				["<C-e>"] = { "hide" },

				["<CR>"] = {
					"accept",
					"fallback",
				},

				["<Tab>"] = {
					"select_next",
					"snippet_forward",
					"fallback",
				},

				["<S-Tab>"] = {
					"select_prev",
					"snippet_backward",
					"fallback",
				},

				["<Up>"] = {
					"select_prev",
					"fallback",
				},

				["<Down>"] = {
					"select_next",
					"fallback",
				},

				["<C-k>"] = {
					"show_signature",
					"hide_signature",
					"fallback",
				},

				["<C-b>"] = {
					"scroll_documentation_up",
					"fallback",
				},

				["<C-f>"] = {
					"scroll_documentation_down",
					"fallback",
				},
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				list = {
					selection = {
						preselect = false,
						auto_insert = true,
					},
				},

				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},

				ghost_text = {
					enabled = true,
				},

				menu = {
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind" },
						},
					},
				},
			},

			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
			},

			snippets = {
				preset = "default",
			},

			signature = {
				enabled = true,
			},

			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
		},
	},
}

return {
    {
        "saghen/blink.cmp",
        version = "1.*",
        event = "InsertEnter",

        dependencies = {
            "rafamadriz/friendly-snippets",
        },

        opts = {
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
                    "scroll_documentation_up",
                    "fallback",
                },

                ["<C-j>"] = {
                    "scroll_documentation_down",
                    "fallback",
                },
            },

            appearance = {
                nerd_font_variant = "mono",
            },

            completion = {
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

            fuzzy = {
                implementation = "prefer_rust_with_warning",
            },
        },
    },
}

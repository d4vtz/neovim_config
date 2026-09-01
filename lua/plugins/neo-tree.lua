return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        lazy = false,

        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },

        cmd = "Neotree",

        keys = {
            {
                "<leader>e",
                "<cmd>Neotree toggle<CR>",
                desc = "Explorador de archivos",
            },
            {
                "<leader>er",
                "<cmd>Neotree reveal<CR>",
                desc = "Revelar archivo actual",
            },
        },

        opts = {
            close_if_last_window = true,

            open_files_do_not_replace_types = {
                "terminal",
                "trouble",
                "qf",
            },

            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    never_show = {
                        ".git",
                    },
                },

                hijack_netrw_behavior = "open_default",
                follow_current_file = {
                    enabled = true,
                },

                use_libuv_file_watcher = true,
            },

            window = {
                width = 32,
            },
        },
    },
}

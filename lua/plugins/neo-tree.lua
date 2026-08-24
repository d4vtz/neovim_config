return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",

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
        },

        opts = {
            close_if_last_window = true,

            filesystem = {
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

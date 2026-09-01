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
                "stylua",
                "ruff",
                "clang-format",
            },

            auto_update = false,
            run_on_start = true,
            start_delay = 0,
            debounce_hours = 24,

            integrations = {
                ["mason-lspconfig"] = false,
                ["mason-null-ls"] = false,
                ["mason-nvim-dap"] = false,
            },
        },
    },
}

return {
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = "VeryLazy",

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
            start_delay = 3000,
            debounce_hours = 24,

            integrations = {
                ["mason-lspconfig"] = false,
                ["mason-null-ls"] = false,
                ["mason-nvim-dap"] = false,
            },
        },
    },
}

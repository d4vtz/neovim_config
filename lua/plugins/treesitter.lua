return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",

        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "json",
                "latex",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "toml",
                "vim",
                "vimdoc",
                "yaml",
            },

            auto_install = true,

            highlight = {
                enable = true,
            },

            indent = {
                enable = true,
            },
        },

        config = function(_, opts)
            require("nvim-treesitter").setup(opts)

            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
}

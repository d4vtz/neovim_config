return {
    {
        "rcarriga/nvim-notify",

        lazy = false,

        opts = {
            stages = "fade_in_slide_out",
            timeout = 2000,
            background_colour = "#000000",
            render = "default",
            max_width = 50,
            max_height = 10,
        },

        config = function(_, opts)
            local notify = require("notify")

            notify.setup(opts)

            vim.notify = notify
        end,
    },
}

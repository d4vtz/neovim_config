local M = {}

function M.module(module)
    package.loaded[module] = nil
    return require(module)
end

function M.config()
    local modules = {
        "config.options",
        "config.keymaps",
        "config.autocmds",
    }

    for _, module in ipairs(modules) do
        M.module(module)
    end

    vim.notify("Configuración recargada", vim.log.levels.INFO)
end

return M

return {
    {
        "rebelot/kanagawa.nvim",
        config = function()
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "*",
                callback = function()
                    vim.cmd("colorscheme kanagawa-dragon")
                end,
            })

            vim.api.nvim_set_hl(0, "CursorLine", { bg = "#282727" })
        end
    },
}

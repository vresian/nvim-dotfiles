return {
    {
        "Zeioth/compiler.nvim",
        dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
        lazy = false,
        opts = {},
    },
    {
        "stevearc/overseer.nvim",
        commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        opts = {
            task_list = {
                direction = "bottom",
                min_height = 40,
                max_height = 40,
                default_detail = 1
            },
        },
        config = function ()
            require("overseer").setup({
                task_list = {
                    direction = "bottom",
                    min_height = 25,
                    max_height = 25,
                    default_detail = 1
                }
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "OverseerList",
                callback = function()
                    local current_buffer = vim.fn.bufnr('%');
                    vim.cmd("tabnew compiler | tabprevious | wincmd c | wincmd c | tabnext");
                    vim.cmd("buffer " .. current_buffer);
                end,
            })
        end
    },
}

return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        dependencies = {
            { "echasnovski/mini.icons", opts = {} },
        },
        lazy = false,
        config = function()
            require("oil").setup({
                win_options = {
                    signcolumn = "yes:2",
                },
            });

            vim.keymap.set("n", "<leader>n", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end
    },
    {
        "refractalize/oil-git-status.nvim",
        dependencies = { "stevearc/oil.nvim" },

        config = true
    }
}

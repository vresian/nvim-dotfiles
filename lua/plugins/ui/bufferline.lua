return {
    --[['akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
        local bufferline = require("bufferline");
        bufferline.setup {
            options = {
                style_preset = bufferline.style_preset.default,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true
                    }
                }
            }
        }
    end]]
}

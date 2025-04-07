require("config.lazy");
require("config.keymapping");

vim.cmd([[
    colorscheme kanagawa-dragon
    set expandtab
    set tabstop=2
    set softtabstop=2
    set shiftwidth=4
    set number
    set nowrap
    set cursorline
    set incsearch
    set nohlsearch
]])
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#282727" })

local fixBufferLineSeparator = function()
  vim.api.nvim_set_hl(0, "BufferLineOffsetSeparator", vim.api.nvim_get_hl_by_name('NvimTreeWinSeparator', true))
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = fixBufferLineSeparator,
})

fixBufferLineSeparator()

vim.g.mapleader = ' ';

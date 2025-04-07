--|-----------------------------------
--|  COMPILER KEYMAPPINGS
--|-----------------------------------

vim.api.nvim_set_keymap('n', '<F6>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-F6>',
     "<cmd>CompilerStop<cr>"
  .. "<cmd>CompilerRedo<cr>",
{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F7>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

--|-----------------------------------
--|  DEBUGGING KEYMAPPINGS
--|-----------------------------------

local dap = require("dap")

vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, {})
vim.keymap.set('n', '<leader>dd', dap.continue, {})

--|-----------------------------------
--|  LSP KEYMAPPINGS
--|-----------------------------------

vim.keymap.set('n', '<leader>er', function() vim.diagnostic.open_float() end, {})

--|-----------------------------------
--|  TELESCOPE KEYMAPPINGS
--|-----------------------------------

local builtin = require('telescope.builtin');
vim.keymap.set('n', '<C-p>', builtin.find_files, {})

--|-----------------------------------
--|  BUFFER KEYMAPPINGS
--|-----------------------------------

--TODO

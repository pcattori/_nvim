require("trouble").setup()

vim.keymap.set('n', '<leader>xx', function() vim.cmd('TroubleToggle') end)
vim.keymap.set('n', '<leader>xw', function() vim.cmd('TroubleToggle workspace_diagnostics') end)
vim.keymap.set('n', '<leader>xd', function() vim.cmd('TroubleToggle document_diagnostics') end)

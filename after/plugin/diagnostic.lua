vim.diagnostic.config({ severity_sort = true })

vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'show diagnostics on current line'})
vim.keymap.set('n', '<leader>dl', require('telescope.builtin').diagnostics, { desc = 'search diagnostics' })
vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, { desc = 'next diagnostic' })
vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, { desc = 'previous diagnostic' })

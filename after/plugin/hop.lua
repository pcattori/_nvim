require('hop').setup()

vim.keymap.set('n', 's', function() vim.cmd('HopWord') end)

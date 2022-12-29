vim.opt.updatetime = 50

-- interop
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

vim.g.mapleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- easy reach
vim.keymap.set({ 'v', 'i' }, ';;', '<Esc>')
vim.keymap.set('i', '<S-Space>', '_')
vim.keymap.set('n', '<C-u>', '<C-f>')
vim.keymap.set('n', '<C-i>', '<C-b>')

-- colors
vim.opt.termguicolors = true
vim.cmd.colorscheme('rose-pine')

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.wrap = false
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.opt.ff = 'unix' -- show `<CR>` as `^M`
vim.opt.list = true
vim.opt.listchars = { nbsp = '␣', tab = ' -→', trail = '·' }

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.shiftround = true
-- persist visual selection when indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.o.formatoptions = vim.o.formatoptions:gsub('o', '') -- no comment continuation when inserting via `o` or `O`

-- windows
vim.opt.laststatus = 3 -- single global statusline
vim.api.nvim_set_hl(0, 'WinSeparator', { bg = 'None' }) -- thin window borders
-- open/close
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.keymap.set('n', '<leader>w', vim.cmd.vnew)
vim.keymap.set('n', '<leader>W', vim.cmd.new)
vim.keymap.set('n', '<leader>q', vim.cmd.close)
-- navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- resize
vim.keymap.set('n', '<C-S-k>', function() vim.cmd('resize +2') end)
vim.keymap.set('n', '<C-S-j>', function() vim.cmd('resize -2') end)
vim.keymap.set('n', '<C-S-h>', function() vim.cmd('vertical resize -2') end)
vim.keymap.set('n', '<C-S-l>', function() vim.cmd('vertical resize +2') end)

-- search
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
-- TODO: https://github.com/neovim/neovim/issues/21009
-- vim.keymap.set('n', '<Backspace>', function() vim.cmd('let @/ = ""') end)

-- terminal
vim.keymap.set('n', '<leader>t', function() vim.cmd('split | terminal') end)
vim.api.nvim_create_augroup('terminal', { clear = true })
vim.api.nvim_create_autocmd('TermOpen', {
    group = 'terminal',
    pattern = '*',
    command = 'startinsert',
})
vim.keymap.set('t', ';;', '<C-\\><C-n>') -- escape terminal mode

-- TODO: easy sort?

local telescope = require('telescope')

local actions = require("telescope.actions")
telescope.setup {
  defaults = {
    prompt_prefix = " 🔭 ",
    mappings = {
      n = {
        [';'] = actions.close,
      },
      i = {
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-j>'] = actions.move_selection_next,
      },
    },
  }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>s?', builtin.builtin, { desc = '[s]earch Telescope' })

vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

local project_files = function()
  if vim.loop.fs_stat(".git") then
    builtin.git_files({ show_untracked = true })
  else
    builtin.find_files()
  end
end
vim.keymap.set('n', '<leader>sf', project_files, { desc = '[s]earch [f]iles' })

local all_files = function()
  builtin.find_files({ hidden = true, no_ignore = true })
end
vim.keymap.set('n', '<leader>sF', all_files, { desc = '[s]earch all [F]iles, including hidden and gitignored' })

vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[s]earch [b]uffers' })

vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[s]earch current [w]ord' })
vim.keymap.set('n', '<leader>sr', builtin.live_grep, { desc = '[s]earch by [r]ipgrep' })

vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[s]earch [h]elp' })

pcall(telescope.load_extension, 'file_browser')
vim.keymap.set('n', '<leader>p', telescope.extensions.file_browser.file_browser, { desc = 'browse [p]aths' })

pcall(telescope.load_extension, 'fzf')

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'help', 'lua', 'javascript', 'typescript' },
  highlight = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-Space>',
      node_incremental = '<C-Space>',
      scope_incremental = '<C-s>',
      node_decremental = '<C-Backspace>',
    },
  },
}

require('indent_blankline').setup {
  show_current_context = true,
}

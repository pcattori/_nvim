local gitsigns = require('gitsigns')
gitsigns.setup({
  on_attach = function(bufnr)
    local map = function(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', '<leader>gs', gitsigns.toggle_signs)
    map('n', '<leader>gb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>gd', gitsigns.toggle_deleted)
  end
})

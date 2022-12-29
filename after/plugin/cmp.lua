vim.opt.completeopt = { 'menuone', 'noselect' }

local cmp = require('cmp')
local luasnip = require('luasnip')

local mapping = cmp.mapping.preset.insert({
  ['<C-Space>'] = cmp.mapping.complete({}),
  ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
  ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
  ['<C-i>'] = cmp.mapping.scroll_docs(-4),
  ['<C-u>'] = cmp.mapping.scroll_docs(4),
})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = mapping,
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 5 },
  }),
})

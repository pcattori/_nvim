local servers = {
  sumneko_lua = {
    Lua = {
      telemetry = { enable = false },
      workspace = { checkThirdParty = false }
    }
  },
  tsserver = {},
}

local telescope_builtin = require('telescope.builtin')
local formatting_group = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  local map = function(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  -- show help
  map('n', 'K', vim.lsp.buf.hover)
  map('i', '<C-k>', vim.lsp.buf.signature_help)

  -- go to X
  map('n', 'gd', vim.lsp.buf.definition, { desc = '[g]o to [d]efinition' })
  map('n', 'gt', vim.lsp.buf.type_definition, { desc = '[g]o to [t]ype definition' })
  map('n', 'gr', telescope_builtin.lsp_references, { desc = '[g]o to [r]eferences' })

  -- search symbols
  map('n', '<leader>ss', telescope_builtin.lsp_document_symbols, { desc = '[s]earch document [s]ymbols' })
  map('n', '<leader>sS', telescope_builtin.lsp_dynamic_workspace_symbols, { desc = '[s]earch workspace [S]ymbols' })

  map('n', '<leader>r', vim.lsp.buf.rename, { desc = '[r]ename' })
  map('n', '<leader>f', vim.lsp.buf.format, { desc = '[f]ormat' })
  map('n', '<leader>wf', function() vim.cmd('noautocmd w') end, { desc = 'write [w]ithout [f]ormatting' })
  map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'run [c]ode [a]ction' })

  -- format on save (https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save#code)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = formatting_group, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = formatting_group,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end

end

-- setup neodev _before_ lspconfig (https://github.com/folke/neodev.nvim#-setup)
require('neodev').setup()

local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end
}

-- add borders to hover docs
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
  },
  on_attach = on_attach
})

require('fidget').setup()

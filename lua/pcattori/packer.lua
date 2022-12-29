local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- fuzzy finder
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-tree/nvim-web-devicons' -- icons in telescope based on filetypes

    -- highlight, edit, and navigate code
    use { 'nvim-treesitter/nvim-treesitter',
        run = function() pcall(require('nvim-treesitter.install').update { with_sync = true }) end }
    -- TODO treesitter context?
    -- TODO treesitter text objects?

    -- lsp
    use 'williamboman/mason.nvim' -- manage lsp servers, dap servers, linters, formatters
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason-lspconfig.nvim'
    use 'j-hui/fidget.nvim' -- progress ui for lsp servers
    use 'jose-elias-alvarez/null-ls.nvim' -- hook into native lsp

    -- completion
    use 'hrsh7th/nvim-cmp'
    -- snippets
    use 'L3MON4D3/LuaSnip' -- snippet engine
    use 'saadparwaiz1/cmp_luasnip' -- integrate snippet engine with cmp
    -- completion providers
    use 'hrsh7th/cmp-nvim-lsp' -- completions from lsp
    use 'hrsh7th/cmp-buffer' -- completions from current file
    use 'hrsh7th/cmp-path' -- completions from filesystem paths

    -- brackets
    use 'tpope/vim-surround' -- motions for parens, brackets, quotes, etc...
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'

    use 'ThePrimeagen/harpoon' -- quick switching for main files
    use 'folke/neodev.nvim' -- help, docs, and completion when editing nvim config
    use 'folke/trouble.nvim' -- diagnostics panel
    use 'lewis6991/gitsigns.nvim' -- show git markers on each line
    use 'lukas-reineke/indent-blankline.nvim' -- indentation guides
    use 'norcalli/nvim-colorizer.lua' -- show colors in code
    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
    use 'nvim-lualine/lualine.nvim' -- status line
    use 'phaazon/hop.nvim' -- teleport the cursor
    use 'rose-pine/neovim' -- color scheme
    use 'tpope/vim-repeat' -- use `.` to repeat complex actions
    use 'tpope/vim-sleuth' -- infer tabstop and shiftwidth

    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePost', {
-- command = 'source <afile> | PackerCompile',
-- group = packer_group,
-- pattern = vim.fn.expand '$MYVIMRC',
-- })

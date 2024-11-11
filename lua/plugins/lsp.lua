return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        print('Lsp config method')
        require('mason').setup({})

        local opts = {
            ensure_installed = {
                'lua_ls'
            }
        }

        require('mason-lspconfig').setup(opts)
        require('lspconfig').lua_ls.setup({})
    end
}

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        require('mason').setup({})

        local opts = {
            ensure_installed = {
                'lua_ls',
                'clangd'
            }
        }

        require('mason-lspconfig').setup(opts)

        -- lua_ls opts
        local lua_ls_opts = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        }

        require('lspconfig').lua_ls.setup(lua_ls_opts)
        require('lspconfig').clangd.setup({})
    end
}

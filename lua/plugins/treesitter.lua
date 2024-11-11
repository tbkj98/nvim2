return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        local opts = {
            ensure_installed = {
                'c',
                'cpp',
                'dart',
                'java',
                'javascript',
                'typescript',
                'json'
            }
        }

        require('nvim-treesitter.configs').setup(opts)
    end
}

return {
        {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            local telescope = require('telescope')

            -- File browser config
            local file_browser_opts= {
                theme = 'ivy',
                hijack_netrw = true
            }

            -- Telesscope options
            local opts = {
                extensions = {
                    file_browser = file_browser_opts
                }
            }

            -- Telescope Setup call
            telescope.setup(opts)

            -- Telescope loading extension file browser:
            telescope.load_extension('file_browser')

            -- Keymaps
            local builtin = require('telescope.builtin')
            local file_browser = telescope.extensions.file_browser

            vim.keymap.set('n', '<leader>ff',builtin.find_files, {desc  = 'Telescope: Find files'})
            vim.keymap.set('n', '<leader>fb',builtin.buffers, {desc  = 'Telescope: Find buffers'})
            vim.keymap.set('n', '<leader>fg',builtin.live_grep, {desc  = 'Telescope: Find text in current working directory'})
            vim.keymap.set('n', '<leader>fh',builtin.help_tags, {desc  = 'Telescope: Find help tags'})
            vim.keymap.set('n', '<leader>fs',builtin.current_buffer_fuzzy_find, {desc  = 'Telescope: Find text in current buffer tags'})
            vim.keymap.set('n', '<leader>ft',builtin.current_buffer_tags, {desc  = 'Telescope: Find tags'})
            vim.keymap.set('n', '<leader>gs',builtin.git_stash, {desc  = 'Telescope: Find git stash'})
            vim.keymap.set('n', '<leader>et',file_browser.file_browser, {desc  = 'Telescope File Browser: Toggle root'})
            
            --open file_browser with the path of the current buffer
            vim.keymap.set("n", "<space>eb", function() file_browser.file_browser({path = '%:p:h', select_buffer = true}) end , {desc = 'Telescope File Browser: Open current buffer'})
        end
    },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = {
         'nvim-telescope/telescope.nvim',
         'nvim-lua/plenary.nvim'
        }
    }
}

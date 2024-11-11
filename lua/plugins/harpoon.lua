-- List of favorite files/marks per project
return {
    -- https://github.com/ThePrimeagen/harpoon
    'ThePrimeagen/harpoon',
    branch = 'master',
    event = 'VeryLazy',
    dependencies = {
        -- https://github.com/nvim-lua/plenary.nvim
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local opts = {
            menu = {
                width = 120
            }
        }
        require('harpoon').setup(opts)

        -- Keymaps
        vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = 'Harpoon: Mark file' })
        vim.keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu, { desc = 'Harpoon: List marks' })
    end
}

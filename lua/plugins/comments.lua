return {
    "folke/todo-comments.nvim",
    config = function()
        require('todo-comments').setup()

        -- Configuring keymaps
        vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>", { silent = true, desc = "TODO: Find comments" })
    end
}

-- List of favorite files/marks per project
return {
  -- https://github.com/ThePrimeagen/harpoon
  "ThePrimeagen/harpoon",
  branch = "master",
  event = "VeryLazy",
  dependencies = {
    -- https://github.com/nvim-lua/plenary.nvim
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local opts = {
      menu = {
        width = 120,
      },
    }
    require("harpoon").setup(opts)

    -- Keymaps
    vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "Harpoon: Mark file" })
    vim.keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu, { desc = "Harpoon: List marks" })

    -- Set h<integer> keymaps for quick access to harpoon marks
    for i = 1, 5 do
      vim.keymap.set("n", "<leader>h" .. i, function()
        require("harpoon.ui").nav_file(i)
      end, { desc = "Harpoon: Navigate" .. i })
    end
  end,
}

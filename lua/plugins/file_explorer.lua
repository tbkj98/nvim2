return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
  {
    "preservim/nerdtree",
    lazy = false,
    keys = {
      { "<leader>ee", "<cmd>NERDTreeToggle<cr>", desc = "NERDTree: Toggle" },
      { "<leader>ef", "<cmd>NERDTreeFind<cr>", desc = "NERDTree: Find File" },
    },
  },
}

return {
  {
    "stevearc/oil.nvim",
    dependencies = {
      "echasnovski/mini.icons",
    },
    lazy = false,
    config = function()
      local opts = {
        default_file_explorer = false,
      }

      require("oil").setup(opts)
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    init = function() end,
    lazy = false,
    config = function()
      local opts = {}
      require("neo-tree").setup(opts)
    end,
  },
}

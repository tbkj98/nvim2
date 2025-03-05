return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        delete = { text = "-" },
        change = { text = "*" },
        untracked = { text = "!" },
        topdelete = { text = "^" },
        changedelete = { text = "~" },
      },
      attach_to_untracked = true,
      current_line_blame_opts = {
        virt_text = true,
        delay = 100,
      },
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)

      -- Setting highlighting groups to change the colors
      vim.api.nvim_set_hl(0, "GitsignsAdd", { fg = "#00FF00" })
      vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#FF0000" })
      vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#FFA500" })
      vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "#00FA00" })
      vim.api.nvim_set_hl(0, "GitSignsTopdelete", { fg = "#FA0000" })
      vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = "#FA0000" })
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ibhagwan/fzf-lua",
      "sindrets/diffview.nvim",
    },
    config = true,
  },
}

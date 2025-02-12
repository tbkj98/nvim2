return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      attach_to_untracked = true,
      current_line_blame_opts = {
        virt_text = true,
        delay = 500,
      },
    },
    config = true,
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

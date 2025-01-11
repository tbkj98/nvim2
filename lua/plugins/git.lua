return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local opts = {
      attach_to_untracked = true,
      current_line_blame_opts = {
        virt_text = true,
        delay = 500,
      },
    }
    require("gitsigns").setup(opts)
  end,
}

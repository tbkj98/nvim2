return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    local opts = {
      disable_when_zoomed = true, -- defaults to false
      keybindings = {
        left = "<M-h>",
        down = "<M-j>",
        up = "<M-k>",
        right = "<M-l>",
        previous = "<M-\\>",
      },
    }
    require("nvim-tmux-navigation").setup(opts)
  end,
}

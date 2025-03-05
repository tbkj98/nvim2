return {
  {
    -- To  highlight the symbol the cursor is on
    "RRethy/vim-illuminate",
  },
  {
    -- To show the indented  lines for functions, classes etc
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  {
    "SmiteshP/nvim-navic",
    opts = {
      separator = "->",
      highlight = true,
      depth_limit = 5,
    },
  },
}

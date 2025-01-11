return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local opts = {
      filetypes = {
        TelescopePrompt = false,
      },
    }
    require("codeium").setup(opts)
  end,
}

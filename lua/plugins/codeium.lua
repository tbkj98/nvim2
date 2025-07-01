return {
  "Exafunction/windsurf.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local opts = {
      filetypes = {
        TelescopePrompt = false,
      },
      virtual_text = {
        enabled = true,
      },
    }
    require("codeium").setup(opts)
  end,
}

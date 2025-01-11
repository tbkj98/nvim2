if true then
  return {}
end
return {
  "folke/which-key.nvim",
  dependencies = {
    "echasnovski/mini.icons",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local which_key = require("which-key")

    which_key.add({
      {
        "<leader>e",
        group = "File Browser",
      },
    })
  end,
}

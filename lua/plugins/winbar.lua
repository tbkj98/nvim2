if true then
  return {}
end
return {
  "Bekaboo/dropbar.nvim",
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  config = function()
    vim.keymap.set("n", "<leader>bn", require("dropbar.api").pick, { desc = "Breadcrumb: Pick item" })
  end,
}

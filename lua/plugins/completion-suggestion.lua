return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
      "xzbdmw/colorful-menu.nvim",
      config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("colorful-menu").setup({})
      end,
    },
  },
  build = "cargo build --release",
  config = function()
    require("blink.cmp").setup({
      signature = { enabled = true },
      keymap = {
        preset = "enter",
      },
      completion = {
        menu = {
          draw = {
            -- We don't need label_description now because label and label_description are already
            -- combined together in label by colorful-menu.nvim.
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
      },
    })
  end,
}

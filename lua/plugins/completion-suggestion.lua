return {
  {
    "saghen/blink.cmp",
    version = "1.6.0",
    dependencies = {
      "rafamadriz/friendly-snippets",
      {
        "xzbdmw/colorful-menu.nvim",
        config = function()
          ---@diagnostic disable-next-line: missing-fields
          require("colorful-menu").setup({})
        end,
      },
      {
        "saghen/blink.compat",
        opts = {
          enable_events = true,
        },
      },
      {
        "Exafunction/windsurf.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
        },
        opts = {
          filetypes = {
            TelescopePrompt = false,
          },
          virtual_text = {
            enabled = false,
          },
        },
        config = function(_, opts)
          require("codeium").setup(opts)
        end,
      },
    },
    config = function()
      require("blink.cmp").setup({
        signature = { enabled = true },
        keymap = {
          preset = "enter",
        },
        sources = {
          per_filetype = {
            codecompanion = { "codecompanion" },
          },
          default = { "lsp", "path", "snippets", "buffer", "codeium" },
          providers = {
            codeium = {
              name = "codeium",
              module = "blink.compat.source",
              score_offset = 3,
            },
          },
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
  },
}

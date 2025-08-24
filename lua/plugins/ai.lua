return {
  "olimorris/codecompanion.nvim",
  opts = {
    llm = {
      default_model = "copilot",
      models = {
        copilot = {
          adapter = "copilot",
        },
      },
    },
  },
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" },
      config = true,
    },
    {
      "echasnovski/mini.diff",
      config = function()
        local diff = require("mini.diff")
        diff.setup({
          -- Disabled by default
          source = diff.gen_source.none(),
        })
      end,
    },
    {
      "HakonHarnes/img-clip.nvim",
      opts = {
        filetypes = {
          codecompanion = {
            prompt_for_file_name = false,
            template = "[Image]($FILE_PATH)",
            use_absolute_path = true,
          },
        },
      },
      config = true,
    },
    {
      "github/copilot.vim",
      -- Disabling the default functionality as CodeCompanion will be our frontend
      -- You can keep these enabled if you want both
      config = function()
        vim.g.copilot_enabled = true
        vim.g.copilot_panel_enabled = false
        vim.g.copilot_suggestion_enabled = true
      end,
    },
  },
}

return {
  "stevearc/conform.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    local opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        java = { "google-java-format" },
        yaml = { "yamlfmt" },
        go = { "gofumpt" },
      },
      format_after_save = {
        async = true,
        enabled = true,
        lsp_format = "fallback",
      },
    }

    require("conform").setup(opts)

    -- Updating vims format expr ro use conform.nvim formatting with gq keymaps
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}

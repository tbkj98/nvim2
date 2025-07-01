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
        typescriptreact = { "prettierd" },
        javascriptreact = { "prettierd" },
        java = { "google-java-format" },
        yaml = { "yamlfmt" },
      },
      format_on_save = {
        enabled = false,
        lsp_fallback = true,
      },
    }

    require("conform").setup(opts)

    -- Updating vims format expr ro use conform.nvim formatting with gq keymaps
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}

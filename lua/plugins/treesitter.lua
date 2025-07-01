return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    local opts = {
      ensure_installed = {
        "c",
        "cpp",
        "dart",
        "java",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "bash",
        "glimmer",
        "prisma",
        "go",
        "html",
        "lua",
        "sql",
        "vim",
        "yaml",
        "tmux",
      },

      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    }

    require("nvim-treesitter.configs").setup(opts)

    -- Utilize Treesitter folds
    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
  end,
}

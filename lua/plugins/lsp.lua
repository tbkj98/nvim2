return {
  -- LSP Configuration
  -- https://github.com/neovim/nvim-lspconfig
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    -- LSP Management
    -- https://github.com/williamboman/mason.nvim
    { "williamboman/mason.nvim" },
    -- https://github.com/williamboman/mason-lspconfig.nvim
    { "williamboman/mason-lspconfig.nvim" },

    -- Auto-Install LSPs, linters, formatters, debuggers
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },

    -- Additional lua configuration, makes nvim stuff amazing!
    -- https://github.com/folke/neodev.nvim
    { "folke/neodev.nvim", opts = {} },

    {
      "saghen/blink.cmp",
    },
  },
  config = function()
    local lsp_capabilities = require("blink.cmp").get_lsp_capabilities({}, true)

    local mason_lspconfig_opts = {
      automatic_installation = true,
      ensure_installed = {
        "bashls",
        "clangd",
        "gradle_ls",
        "lua_ls",
        "jdtls",
        "jsonls",
        "marksman",
        "yamlls",
        "ts_ls",
        "denols",
        "gopls",
      },
    }

    require("mason").setup()
    require("mason-lspconfig").setup(mason_lspconfig_opts)

    require("mason-tool-installer").setup({
      -- Install these linters, formatters, debuggers automatically
      ensure_installed = {
        "java-debug-adapter",
        "java-test",
        "google-java-format",
        "prettierd",
        "yamlfmt",
        "stylua",
        "gofumpt",
      },
    })

    -- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
    vim.api.nvim_command("MasonToolsInstall")

    local lspconfig = require("lspconfig")

    -- Lua LSP settings
    lspconfig.lua_ls.setup({
      lsp_capabilities = lsp_capabilities,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          format = {
            enable = false,
          },
        },
      },
    })

    lspconfig.clangd.setup({
      lsp_capabilities = lsp_capabilities,
      settings = {},
    })

    -- Go LSP settings
    lspconfig.gopls.setup({
      settings = {
        ["ui.inlayhint.hints"] = {
          compositeLiteralFields = true,
          constantValues = true,
          parameterNames = true,
        },
      },
    })
  end,
}

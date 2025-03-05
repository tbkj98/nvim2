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
      "SmiteshP/nvim-navic",
    },
    {
      "saghen/blink.cmp",
    },
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_installation = true,
      -- Install these LSPs automatically
      ensure_installed = {
        "bashls",
        "clangd",
        "emmet_ls",
        "gradle_ls",
        "lua_ls",
        "jdtls",
        "jsonls",
        "marksman",
        "yamlls",
        "ts_ls",
      },
    })

    require("mason-tool-installer").setup({
      -- Install these linters, formatters, debuggers automatically
      ensure_installed = {
        "java-debug-adapter",
        "java-test",
        "google-java-format",
        "prettierd",
        "yamlfmt",
        "stylua",
      },
    })

    -- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
    vim.api.nvim_command("MasonToolsInstall")

    local lspconfig = require("lspconfig")
    local lsp_capabilities = require("blink.cmp").get_lsp_capabilities()

    local navic = require("nvim-navic")

    local lsp_attach = function(client, bufnr)
      -- Create your keybindings here...

      -- Attaching to navic symbol helper in winbar
      navic.attach(client, bufnr)
    end

    -- local lsp_capabilities = require("blink.cmp").get_lsp_capabilities()

    -- Call setup on each LSP server
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        -- Don't call setup for jdtls Java LSP because it will be setup from a separate config
        if server_name == "jdtls" then
          return
        end

        if server_name == "ts_ls" then
          lspconfig[server_name].setup({
            root_dir = require("lspconfig.util").root_pattern("tsconfig.json", "jsconfig.json", "package.json"),
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
            single_file_support = false,
          })
          return
        end

        lspconfig[server_name].setup({
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
        })
      end,
    })

    -- Lua LSP settings
    lspconfig.lua_ls.setup({
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

    -- Setup deno LSP
    lspconfig.denols.setup({
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    })
    vim.g.markdown_fenced_languages = { "ts=typescript" }

    -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
    local open_floating_preview_default = vim.lsp.util.open_floating_preview

    local open_floating_preview_default_dup = function(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded" -- Set border to rounded
      open_floating_preview_default(contents, syntax, opts, ...)
    end

    vim.lsp.util.open_floating_preview = open_floating_preview_default_dup
  end,
}

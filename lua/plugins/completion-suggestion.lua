-- Auto-completion / Snippets
if true then
  return {}
end
return {
  -- https://github.com/hrsh7th/nvim-cmp
  "hrsh7th/nvim-cmp",
  event = "VimEnter",
  dependencies = {
    -- Snippet engine & associated nvim-cmp source
    -- https://github.com/L3MON4D3/LuaSnip
    "L3MON4D3/LuaSnip",
    -- https://github.com/saadparwaiz1/cmp_luasnip
    "saadparwaiz1/cmp_luasnip",

    -- LSP completion capabilities
    -- https://github.com/hrsh7th/cmp-nvim-lsp
    "hrsh7th/cmp-nvim-lsp",

    -- Additional user-friendly snippets
    -- https://github.com/rafamadriz/friendly-snippets
    "rafamadriz/friendly-snippets",
    -- https://github.com/hrsh7th/cmp-buffer
    "hrsh7th/cmp-buffer",
    -- https://github.com/hrsh7th/cmp-path
    "hrsh7th/cmp-path",
    -- https://github.com/hrsh7th/cmp-cmdline
    "hrsh7th/cmp-cmdline",
    -- Icons for suggestions
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()
    luasnip.config.setup({})

    local snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    }

    local sources = cmp.config.sources({
      { name = "codeium" },
      { name = "nvim_lsp" }, -- lsp
      { name = "luasnip" }, -- snippets
      { name = "buffer" }, -- text within current buffer
      { name = "path" }, -- file system paths
    })

    local window = {
      -- Add borders to completions popups
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }

    local mappings = cmp.mapping.preset.insert({
      ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
      ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
      ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll backward
      ["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll forward
      ["<C-Space>"] = cmp.mapping.complete({}), -- show completion suggestions
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      -- Tab through suggestions or when a snippet is active, tab to the next argument
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      -- Tab backwards through suggestions or when a snippet is active, tab to the next argument
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    })

    local lspkind = require("lspkind")

    local formatting = {
      format = lspkind.cmp_format({
        mode = "symbol_text", -- show only symbol annotations
        maxwidth = {
          -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          -- can also be a function to dynamically calculate max width such as
          -- menu = function() return math.floor(0.45 * vim.o.columns) end,
          menu = 50, -- leading text (labelDetails)
          abbr = 50, -- actual suggestion item
        },
        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        show_labelDetails = true, -- show labelDetails in menu. Disabled by default
      }),
    }

    cmp.setup({
      snippet = snippet,
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      mapping = mappings,
      sources = sources,
      window = window,
      formatting = formatting,
    })
  end,
}

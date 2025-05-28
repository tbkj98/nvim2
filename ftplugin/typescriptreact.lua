local lsp_attach = require("nvim-navic").attach
local lsp_capabilities = require("blink.cmp").get_lsp_capabilities({}, true)

vim.lsp.start({
  name = "ts_ls",
  cmd = { "typescript-language-server", "--stdio" },
  root_dir = vim.fs.root(0, { "tsconfig.json", "jsconfig.json", "package.json" }),
  capabilities = lsp_capabilities,
  on_attach = lsp_attach,
})

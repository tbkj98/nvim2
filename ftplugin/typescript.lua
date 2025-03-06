-- Check whether it's a deno project or not
local deno_files = { "deno.json", "deno.jsonc", "deno.lock" }
local is_deno_project = function()
  for _, filepath in ipairs(deno_files) do
    filepath = table.concat({ vim.fn.getcwd(), filepath }, "/")

    if vim.uv.fs_stat(filepath) ~= nil then
      return true
    end
  end

  return false
end

local lsp_attach = require("nvim-navic").attach
local lsp_capabilities = require("blink.cmp").get_lsp_capabilities({}, true)

if not is_deno_project() then
  vim.lsp.start({
    name = "ts_ls",
    cmd = { "typescript-language-server", "--stdio" },
    root_dir = vim.fs.root(0, { "tsconfig.json", "jsconfig.json", "package.json" }),
    capabilities = lsp_capabilities,
    on_attach = lsp_attach,
  })
else
  vim.g.markdown_fenced_languages = { "ts=typescript" }

  vim.lsp.start({
    name = "denols",
    cmd = { "deno", "lsp" },
    root_dir = vim.fs.root(0, deno_files),
    capabilities = lsp_capabilities,
    on_attach = lsp_attach,
  })
end

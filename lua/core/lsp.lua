vim.diagnostic.config({
  virtual_lines = true,
  virtual_text = false, -- Disable virtual text if you prefer lines
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
    header = "Diagnostics",
    prefix = "",
  },
})

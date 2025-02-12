function ApplyColors()
  -- Normal background transparency
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

  -- Status line transparency
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = "#0EF2EA" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", fg = "#98EAE7" })

  -- Message area(command) text colors
  vim.api.nvim_set_hl(0, "MsgArea", { fg = "#0EF2EA", bold = true })

  -- Line number colors
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#98EAE7" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#0EF2EA", bold = true })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#98EAE7" })

  -- Cursor/CursorLine config
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "none", bold = true })

  -- Vertical left line of line numbers config
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none", fg = "none" }) -- Left side of number line coloring
end

ApplyColors()

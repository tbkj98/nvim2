function ApplyColors(colors)
	-- Applying color scheme
	-- local colorscheme = colors or 'tokyonight'
	-- vim.cmd.colorscheme(colorscheme);

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

	-- NvimTree color config
	vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none", fg = "none" })
	vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "none", fg = "#0EF2EA" })
	vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { bg = "none", fg = "none" })
	vim.api.nvim_set_hl(0, "NvimTreeNormalFloatBorder", { bg = "none", fg = "none" })
	vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none", fg = "none" })
	vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "none", fg = "none" })

	-- Vertical left line of line numbers config
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none", fg = "none" }) -- Left side of number line coloring

	-- Telescope background color config
	vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = "none", fg = "#0EF2EA", bold = true })
	vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "none", fg = "#0EF2EA" })
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none", fg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none", fg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
end

ApplyColors()

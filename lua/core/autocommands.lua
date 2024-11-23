-- Auto commands

-- Create auto commands on win leave to write buffer in background
-- vim.api.nvim_create_autocmd("BufLeave", { pattern = "*.lua", command = "w" })

-- Disabling spell check for certain file types
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "TelescopePrompt", "checkhealth", "qf" },
	command = "setlocal nospell",
})

-- Disabling spell check for certain file types
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	command = "setlocal nospell",
})

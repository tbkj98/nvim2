return {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local opts = {
			enable_chat = true,
			virtual_text = {
				enabled = true,
			},
			filetypes = {
				TelescopePrompt = false,
			},
		}
		require("codeium").setup(opts)
	end,
}

return {
	"stevearc/conform.nvim",
	config = function()
		local opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				java = { "google-java-format" },
				yaml = { "yamlfmt" },
			},
			format_on_save = {
				enabled = true,
				lsp_fallback = true,
			},
		}

		require("conform").setup(opts)

		-- Updating vims format expr ro use conform.nvim formatting with gq keymaps
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}

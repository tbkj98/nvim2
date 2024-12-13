return {
	"nguyenvukhang/nvim-toggler",
	config = function()
		local opts = {
			-- your own inverses
			inverses = {
				["vim"] = "emacs",
				-- ["true"] = "false",
				-- ["false"] = "true",
			},
			-- removes the default <leader>i keymap
			remove_default_keybinds = true,
			-- removes the default set of inverses
			remove_default_inverses = false,
			-- auto-selects the longest match when there are multiple matches
			autoselect_longest_match = false,
		}

		local toggler = require("nvim-toggler")
		toggler.setup(opts)

		-- Keyamps
		vim.keymap.set("n", "<leader>wt", toggler.toggle, { desc = "Toggler: Toggle word", silent = true })
	end,
}

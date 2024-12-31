return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local file_ignore_opts = {
			"node_modules/",
			".*.class",
			".gradle/",
			"gradle/",
			"build/",
			".settings/",
			".git/",
			".factorypath",
			".project",
			".classpath",
			"dist",
			"bin/",
		}

		local keymap_opts = {
			builtin = {
				["<C-d>"] = "preview-page-down",
				["<C-u>"] = "preview-page-up",
			},
		}

		local opts = {
			file_ignore_opts = file_ignore_opts,
			keymap = keymap_opts,
		}

		local fzf = require("fzf-lua")
		fzf.setup(opts)

		-- Keymaps
		vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "FZF: Files" })
		vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "FZF: Files (recent)" })
		vim.keymap.set("n", "<leader>fg", fzf.live_grep_resume, { desc = "FZF: Live grep" })
		vim.keymap.set("n", "<leader>fG", fzf.lines, { desc = "FZF: Live grep (open buffers)" })
		vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "FZF: Buffers" })
		vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "FZF: Help tags" })
		vim.keymap.set("n", "<leader>fs", fzf.blines, { desc = "FZF: Search current buffer" })
		vim.keymap.set("n", "<leader>fq", fzf.quickfix, { desc = "FZF: Search quickfix list" })

		vim.keymap.set("n", "<leader>gs", fzf.git_stash, { desc = "Git: Stash" })
		vim.keymap.set("n", "<leader>gg", fzf.git_status, { desc = "Git: Status" })

		vim.keymap.set("n", "<leader>'", fzf.marks, { desc = "FZF: List marks" })
		vim.keymap.set("n", '<leader>"', fzf.registers, { desc = "FZF: List registers" })

		vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "FZF: List keymaps" })

		vim.keymap.set("n", "<leader><leader>", fzf.command_history, { desc = "FZF: command history" })

		vim.keymap.set("n", "<leader>ld", fzf.lsp_definitions, { desc = "FZF: LSP -> Definitions" })
		-- vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "FZF: LSP -> Definitions" })
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "LSP -> Rename" })
		vim.keymap.set("n", "<leader>la", fzf.lsp_code_actions, { desc = "FZF: LSP -> Code actions" })
		vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "LSP: Hover" })
		vim.keymap.set("n", "<leader>lI", fzf.lsp_implementations, { desc = "FZF: LSP -> Find implementations" })
		vim.keymap.set("n", "<leader>lR", fzf.lsp_references, { desc = "FZF: LSP -> Find references" })
		vim.keymap.set("n", "<leader>lM", fzf.lsp_document_symbols, { desc = "FZF: LSP -> Find methods" })
		vim.keymap.set("n", "<leader>lF", fzf.lsp_document_symbols, { desc = "FZF: LSP -> Find functions" })
		vim.keymap.set(
			"n",
			"<leader>le",
			fzf.lsp_document_diagnostics,
			{ desc = "FZF: LSP -> Find diagnostics errors" }
		)
		vim.keymap.set(
			"n",
			"<leader>lE",
			fzf.lsp_workspace_diagnostics,
			{ desc = "FZF: LSP -> Find diagnostics errors" }
		)

		vim.keymap.set("n", "<leader>ft", fzf.tabs, { desc = "FZF: Find tabs" })
	end,
}

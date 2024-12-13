return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			local telescope = require("telescope")

			-- File browser config
			local file_browser_opts = {
				theme = "ivy",
				hijack_netrw = true,
			}

			-- File ignore opts
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

			-- Telesscope options
			local opts = {
				extensions = {
					file_browser = file_browser_opts,
					fzf = {},
				},
				defaults = {
					file_ignore_patterns = file_ignore_opts,
					path_display = function(_, path)
						local tail = require("telescope.utils").path_tail(path)
						return string.format("%s (%s)", tail, path), { { { 1, #tail }, "Constant" } }
					end,
					dynamic_preview_title = true,
				},
			}

			-- Telescope Setup call
			telescope.setup(opts)

			-- Telescope loading extension file browser:
			telescope.load_extension("file_browser")

			-- Telescope UI selector config
			telescope.load_extension("ui-select")

			-- Telescope command line extension
			telescope.load_extension("cmdline")

			-- Telescope FZF extension
			telescope.load_extension("fzf")

			-- Keymaps
			local builtin = require("telescope.builtin")
			local file_browser = telescope.extensions.file_browser

			local find_files_without_preview = function()
				builtin.find_files({
					previewer = false,
				})
			end

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Find files" })
			vim.keymap.set(
				"n",
				"<leader>fp",
				find_files_without_preview,
				{ desc = "Telescope: Find files (w/o preview)" }
			)
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope: Find buffers" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
				desc = "Telescope: Find text in current working directory",
			})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Find help tags" })
			vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, {
				desc = "Telescope: Find text in current buffer",
			})
			vim.keymap.set("n", "<leader>gs", builtin.git_stash, { desc = "Git: Stash" })
			vim.keymap.set("n", "<leader>gg", builtin.git_status, { desc = "Git: Status" })
			vim.keymap.set("n", "<leader>et", file_browser.file_browser, { desc = "File Browser: Toggle root" })

			-- Open file_browser with the path of the current buffer
			vim.keymap.set("n", "<leader>eb", function()
				file_browser.file_browser({ path = "%:p:h", select_buffer = true })
			end, { desc = "File Browser: Open current buffer" })

			-- Show buffer references
			vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, {
				desc = "Telescope: Find current buffer symbols",
			})

			-- Keymaps to list vim marks
			vim.keymap.set("n", "<leader>'", builtin.marks, { desc = "Telescope: List marks" })

			--Keymaps to list vim registers
			vim.keymap.set("n", '<leader>"', builtin.registers, { desc = "Telescope: List registers" })

			-- keymaps to list command history
			-- Launch command line
			local cmdline_opts = { desc = "Telescope: List command history", silent = true }
			vim.keymap.set("n", "<leader><leader>", "<cmd> Telescope cmdline<cr>", cmdline_opts)

			-- Keymap to find keymaps
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope: Find keymaps" })
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"jonarrien/telescope-cmdline.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
}

-- START: Window navigation keymaps
vim.keymap.set(
	"t",
	"<ESC><ESC>",
	"<C-\\><C-n>",
	{ silent = true, desc = "Window: Switch mode: Terminal -> Normal", noremap = true }
)
vim.keymap.set(
	"t",
	"<M-h>",
	"<c-\\><c-n><c-w>h",
	{ desc = "Window: Terminal mode -> Move focus left", silent = true, noremap = true }
)
vim.keymap.set(
	"t",
	"<M-j>",
	"<c-\\><c-n><c-w>j",
	{ desc = "Window: Terminal mode -> Move focus down", silent = true, noremap = true }
)
vim.keymap.set(
	"t",
	"<M-k>",
	"<c-\\><c-n><c-w>k",
	{ desc = "Window: Terminal mode -> Move focus up", silent = true, noremap = true }
)
vim.keymap.set(
	"t",
	"<M-l>",
	"<c-\\><c-n><c-w>l",
	{ desc = "Window: Terminal mode -> Move focus right", silent = true, noremap = true }
)
vim.keymap.set(
	"i",
	"<M-h>",
	"<Esc><c-w>h",
	{ desc = "Window: Insert mode -> Move focus left", silent = true, noremap = true }
)
vim.keymap.set(
	"i",
	"<M-j>",
	"<Esc><c-w>j",
	{ desc = "Window: Insert  mode -> Move focus down", silent = true, noremap = true }
)
vim.keymap.set(
	"i",
	"<M-k>",
	"<Esc><c-w>k",
	{ desc = "Window: Insert mode -> Move focus up", silent = true, noremap = true }
)
vim.keymap.set(
	"i",
	"<M-l>",
	"<Esc><c-w>l",
	{ desc = "Window: Insert mode -> Move focus right", silent = true, noremap = true }
)
vim.keymap.set(
	"v",
	"<M-h>",
	"<Esc><c-w>h",
	{ desc = "Window: Visual mode -> move focus left", silent = true, noremap = true }
)
vim.keymap.set(
	"v",
	"<M-j>",
	"<Esc><c-w>j",
	{ desc = "Window: Visual  mode -> move focus down", silent = true, noremap = true }
)
vim.keymap.set(
	"v",
	"<M-k>",
	"<Esc><c-w>k",
	{ desc = "Window: Visual mode -> move focus up", silent = true, noremap = true }
)
vim.keymap.set(
	"v",
	"<M-l>",
	"<Esc><c-w>l",
	{ desc = "Window: Visual mode -> move focus right", silent = true, noremap = true }
)
vim.keymap.set(
	"n",
	"<M-h>",
	"<c-w>h",
	{ desc = "Window: Normal mode -> move focus left", silent = true, noremap = true }
)
vim.keymap.set(
	"n",
	"<M-j>",
	"<c-w>j",
	{ desc = "Window: Normal  mode -> move focus down", silent = true, noremap = true }
)
vim.keymap.set("n", "<M-k>", "<c-w>k", { desc = "Window: Normal mode -> move focus up", silent = true, noremap = true })
vim.keymap.set(
	"n",
	"<M-l>",
	"<c-w>l",
	{ desc = "Window: Normal mode -> move focus right", silent = true, noremap = true }
)
-- Window vertical maximize
vim.keymap.set("n", "<leader>w|", "<C-W>|", { desc = "Window: Vertical maximize", noremap = true, silent = true })
-- Window horizontal maximize
vim.keymap.set("n", "<leader>w_", "<C-W>_", { desc = "Window: Horizontal maximize", noremap = true, silent = true })
-- Window reset
vim.keymap.set("n", "<leader>w=", "<C-W>=", { desc = "Window: reset maximize", noremap = true, silent = true })
-- END: Window navigation keymaps

-- START: Tabs navigation keymaps
vim.api.nvim_set_keymap("n", "<M-]>", "gt", { silent = true, noremap = true, desc = "Tabs: Next tab" })
vim.api.nvim_set_keymap("n", "<M-[>", "gT", { silent = true, noremap = true, desc = "Tabs: Previous tab" })
-- move current tab to previous position
vim.api.nvim_set_keymap(
	"n",
	"<leader>tmp",
	":-tabmove<CR>",
	{ silent = true, noremap = true, desc = "Tabs: Move tab to left" }
)
-- move current tab to next position
vim.api.nvim_set_keymap(
	"n",
	"<leader>tmn",
	":+tabmove<CR>",
	{ silent = true, noremap = true, desc = "Tabs: Move tab to right" }
)
-- END: Tabs navigation keymaps

-- START: LSP Keymaps
local list_methods = function()
	require("telescope.builtin").treesitter({ default_text = ":method:" })
end

local list_diagnostics_errors = function()
	require("telescope.builtin").diagnostics({ default_text = ":E:" })
end

local list_diagnostics_warnings = function()
	require("telescope.builtin").diagnostics({ default_text = ":W:" })
end

vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "LSP: Rename symbol" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP: Code action" })
vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "LSP: Hover" })
vim.keymap.set("n", "<leader>lI", vim.lsp.buf.implementation, { desc = "LSP: Find implementations" })
vim.keymap.set("n", "<leader>lR", vim.lsp.buf.references, { desc = "LSP: Find references" })
vim.keymap.set("n", "<leader>lM", list_methods, { desc = "LSP: Find methods" })
vim.keymap.set("n", "<leader>lE", list_diagnostics_errors, { desc = "LSP: Find diagnostics errors" })
vim.keymap.set("n", "<leader>lW", list_diagnostics_warnings, { desc = "LSP: Find diagnostics warnings" })
-- END: LSP Keymaps

-- START: Debugger Keymaps
vim.keymap.set("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Debugger: Toggle breakpoint" })
-- END: Debugger keymaps

-- START: Breadcrumb navigation
vim.keymap.set("n", "<leader>bn", require("dropbar.api").pick, { desc = "Breadcrumb: Pick item", silent = true })
-- END: Breadcrumb navigation

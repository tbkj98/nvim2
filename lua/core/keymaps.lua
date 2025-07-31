local generate_keymap_opts = function(desc)
  return { silent = true, noremap = true, desc = desc }
end

-- START: Window navigation keymaps
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", generate_keymap_opts("Window: Switch mode: Terminal -> Normal"))
vim.keymap.set(
  "t",
  "<M-h>",
  "<c-\\><c-n><cmd> NvimTmuxNavigateLeft<cr>",
  generate_keymap_opts("Window: Terminal mode -> Move focus left")
)
vim.keymap.set(
  "t",
  "<M-j>",
  "<c-\\><c-n><cmd> NvimTmuxNavigateDown<cr>",
  generate_keymap_opts("Window: Terminal mode -> Move focus down")
)
vim.keymap.set(
  "t",
  "<M-k>",
  "<c-\\><c-n><cmd> NvimTmuxNavigateUp<cr>",
  generate_keymap_opts("Window: Terminal mode -> Move focus up")
)
vim.keymap.set(
  "t",
  "<M-l>",
  "<c-\\><c-n><cmd> NvimTmuxNavigateRight<cr>",
  generate_keymap_opts("Window: Terminal mode -> Move focus right")
)
vim.keymap.set(
  "i",
  "<M-h>",
  "<Esc><cmd> NvimTmuxNavigateLeft<cr>",
  generate_keymap_opts("Window: Insert mode -> Move focus left")
)
vim.keymap.set(
  "i",
  "<M-j>",
  "<Esc><cmd> NvimTmuxNavigateDown<cr>",
  generate_keymap_opts("Window: Insert mode -> Move focus down")
)
vim.keymap.set(
  "i",
  "<M-k>",
  "<Esc><cmd> NvimTmuxNavigateUp<cr>",
  generate_keymap_opts("Window: Insert mode -> Move focus up")
)
vim.keymap.set(
  "i",
  "<M-l>",
  "<Esc><cmd> NvimTmuxNavigateRight<cr>",
  generate_keymap_opts("Window: Insert mode -> Move focus right")
)
vim.keymap.set(
  "v",
  "<M-h>",
  "<Esc><cmd> NvimTmuxNavigateLeft<cr>",
  generate_keymap_opts("Window: Visual mode -> Move focus left")
)
vim.keymap.set(
  "v",
  "<M-j>",
  "<Esc><cmd> NvimTmuxNavigateDown<cr>",
  generate_keymap_opts("Window: Visual mode -> Move focus down")
)
vim.keymap.set(
  "v",
  "<M-k>",
  "<Esc><cmd> NvimTmuxNavigateUp<cr>",
  generate_keymap_opts("Window: Visual mode -> Move focus up")
)
vim.keymap.set(
  "v",
  "<M-l>",
  "<Esc><cmd> NvimTmuxNavigateRight<cr>",
  generate_keymap_opts("Window: Visual mode -> Move focus right")
)
vim.keymap.set(
  "n",
  "<M-h>",
  "<cmd>NvimTmuxNavigateLeft<cr>",
  generate_keymap_opts("Window: Normal mode -> move focus left")
)
vim.keymap.set(
  "n",
  "<M-j>",
  "<cmd>NvimTmuxNavigateDown<cr>",
  generate_keymap_opts("Window: Normal mode -> move focus down")
)
vim.keymap.set(
  "n",
  "<M-k>",
  "<cmd>NvimTmuxNavigateUp<cr>",
  generate_keymap_opts("Window: Normal mode -> move focus up")
)
vim.keymap.set(
  "n",
  "<M-l>",
  "<cmd>NvimTmuxNavigateRight<cr>",
  generate_keymap_opts("Window: Normal mode -> move focus right")
)
-- Window vertical maximize
vim.keymap.set("n", "<leader>w|", "<c-w>|", generate_keymap_opts("Window: Vertical maximize"))
-- Window horizontal maximize
vim.keymap.set("n", "<leader>w_", "<c-w>_", generate_keymap_opts("Window: Horizontal maximize"))
-- Window reset
vim.keymap.set("n", "<leader>w=", "<c-w>=", generate_keymap_opts("Window: reset maximize"))
-- END: Window navigation keymaps

-- START: Tabs navigation keymaps
vim.keymap.set("n", "<M-]>", "gt", generate_keymap_opts("Tabs: Normal mode -> Next tab"))
vim.keymap.set("n", "<M-[>", "gT", generate_keymap_opts("Tabs: Normal mode -> Previous tab"))
vim.keymap.set("t", "<M-]>", "<C-\\><C-n>gt", generate_keymap_opts("Tabs: Terminal mode -> Next tab"))
vim.keymap.set("t", "<M-[>", "<C-\\><C-n>gT", generate_keymap_opts("Tabs: Terminal mode -> Previous tab"))
vim.keymap.set("i", "<M-]>", "<Esc>gt", generate_keymap_opts("Tabs: Insert mode -> Next tab"))
vim.keymap.set("i", "<M-[>", "<Esc>gT", generate_keymap_opts("Tabs: Insert mode -> Previous tab"))
-- move current tab to previous position
vim.keymap.set("n", "<leader>tmp", ":-tabmove<CR>", generate_keymap_opts("Tabs: Move tab to left"))
-- move current tab to next position
vim.keymap.set("n", "<leader>tmn", ":+tabmove<CR>", generate_keymap_opts("Tabs: Move tab to right"))
-- END: Tabs navigation keymaps

-- START: Debugger Keymaps
vim.keymap.set("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, generate_keymap_opts("Debugger: Toggle breakpoint"))
-- END: Debugger keymaps

-- START: Git Keymaps
vim.keymap.set(
  "n",
  "<leader>gl",
  '<cmd>lua require "gitsigns".blame_line()<CR>',
  generate_keymap_opts("Git: Blame line")
)
vim.keymap.set(
  "n",
  "<leader>gp",
  '<cmd>lua require "gitsigns".preview_hunk()<CR>',
  generate_keymap_opts("Git: Preview hunk")
)
vim.keymap.set(
  "n",
  "<leader>gt",
  '<cmd>lua require "gitsigns".toggle_current_line_blame()<CR>',
  generate_keymap_opts("Git: Toggle current line blame")
)
-- END: Git Keymaps

-- START: Quickfix list navigation
vim.keymap.set("n", "[q", "<cmd> cprev <CR>", generate_keymap_opts("Quickfix: Next item"))
vim.keymap.set("n", "]q", "<cmd> cnext <CR>", generate_keymap_opts("Quickfix: Previous item"))
-- END: Quickfix list navigation

-- START: Vertical UP,DOWN,MID navigation
vim.keymap.set("n", "H", "Hzz", { expr = false, silent = true })
vim.keymap.set("n", "L", "Lzz", { expr = false, silent = true })
-- END: Vertical UP,DOWN,MID navigation

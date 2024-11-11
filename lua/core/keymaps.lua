-- START: Window navigation keymaps
vim.keymap.set('t', '<ESC><ESC>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('t', '<M-h>', '<c-\\><c-n><c-w>h', { noremap = true })
vim.keymap.set('t', '<M-j>', '<c-\\><c-n><c-w>j', { noremap = true })
vim.keymap.set('t', '<M-k>', '<c-\\><c-n><c-w>k', { noremap = true })
vim.keymap.set('t', '<M-l>', '<c-\\><c-n><c-w>l', { noremap = true })
vim.keymap.set('i', '<M-h>', '<Esc><c-w>h', { noremap = true })
vim.keymap.set('i', '<M-j>', '<Esc><c-w>j', { noremap = true })
vim.keymap.set('i', '<M-k>', '<Esc><c-w>k', { noremap = true })
vim.keymap.set('i', '<M-l>', '<Esc><c-w>l', { noremap = true })
vim.keymap.set('v', '<M-h>', '<Esc><c-w>h', { noremap = true })
vim.keymap.set('v', '<M-j>', '<Esc><c-w>j', { noremap = true })
vim.keymap.set('v', '<M-k>', '<Esc><c-w>k', { noremap = true })
vim.keymap.set('v', '<M-l>', '<Esc><c-w>l', { noremap = true })
vim.keymap.set('n', '<M-h>', '<c-w>h', { noremap = true })
vim.keymap.set('n', '<M-j>', '<c-w>j', { noremap = true })
vim.keymap.set('n', '<M-k>', '<c-w>k', { noremap = true })
vim.keymap.set('n', '<M-l>', '<c-w>l', { noremap = true })
-- END: Window navigation keymaps

-- START: Tabs navigation keymaps
vim.api.nvim_set_keymap('n', '<M-]>', 'gt', { silent = true, noremap = true, desc = "Next tab" })
vim.api.nvim_set_keymap('n', '<M-[>', 'gT', { silent = true, noremap = true, desc = "Previous tab" })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>",
    { silent = true, noremap = true, desc = 'Switch tab to left' })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>",
    { silent = true, noremap = true, desc = 'Switch tab to right' })
-- END: Tabs navigation keymaps


-- START: LSP Keymaps
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { desc = 'LSP: Go to definition' })
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'LSP: Rename symbol' })
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'LSP: Code action' })
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, { desc = 'LSP: Hover' })
vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, { desc = 'LSP: Find implementations' })
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = 'LSP: FInd references' })
-- END: LSP Keymaps

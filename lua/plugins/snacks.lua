return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      enabled = true,
      matcher = {
        cwd_bonus = true,
        frecency = true,
      },
      win = {},
    },
    scope = { enabled = true },
  },
  config = function(_, opts)
    local snacks = require("snacks")
    snacks.setup(opts)

    vim.keymap.set("n", "<leader>ff", snacks.picker.files, { desc = "Snacks: Find Files" })
    vim.keymap.set("n", "<leader>fr", snacks.picker.smart, { desc = "Snacks: Recent Files" })
    vim.keymap.set("n", "<leader>fb", snacks.picker.buffers, { desc = "Snacks: Find Buffers" })
    vim.keymap.set("n", "<leader>fg", snacks.picker.grep, { desc = "Snacks: Live Grep" })
    vim.keymap.set("n", "<leader>fG", snacks.picker.grep_buffers, { desc = "Snacks: Live Grep (buffers)" })
    vim.keymap.set("n", "<leader>fh", snacks.picker.help, { desc = "Snacks: Find Help" })
    vim.keymap.set("n", "<leader>fs", snacks.picker.lines, { desc = "Snacks: Find In Buffer" })
    vim.keymap.set("n", "<leader>fq", snacks.picker.qflist, { desc = "Snacks: Find Quickfix List" })
    vim.keymap.set("n", "<leader>fk", snacks.picker.keymaps, { desc = "Snacks: Find Keymaps" })
    vim.keymap.set("n", "<leader>'", snacks.picker.marks, { desc = "Snacks: Find Marks" })
    vim.keymap.set("n", '<leader>"', snacks.picker.registers, { desc = "Snacks: Find Registers" })

    vim.keymap.set("n", "<leader>gs", snacks.picker.git_stash, { desc = "Git: Stash" })
    vim.keymap.set("n", "<leader>gg", snacks.picker.git_status, { desc = "Git: Status" })
    vim.keymap.set("n", "<leader>gb", snacks.picker.git_branches, { desc = "Git: Branch" })
    vim.keymap.set("n", "<leader>gd", snacks.picker.git_diff, { desc = "Git: Diff" })

    vim.keymap.set("n", "<leader>ld", snacks.picker.lsp_definitions, { desc = "LSP: Definitions" })
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "LSP: Rename" })
    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP: Code actions" })
    vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "LSP: Hover" })
    vim.keymap.set("n", "<leader>lI", snacks.picker.lsp_implementations, { desc = "LSP: Find implementations" })
    vim.keymap.set("n", "<leader>lR", snacks.picker.lsp_references, { desc = "LSP: Find references" })
    vim.keymap.set("n", "<leader>lM", snacks.picker.lsp_symbols, { desc = "LSP: Find symbols" })
    vim.keymap.set(
      "n",
      "<leader>le",
      snacks.picker.diagnostics_buffer,
      { desc = "snacks: LSP: Find diagnostics errors" }
    )
    vim.keymap.set("n", "<leader>lE", snacks.picker.diagnostics, { desc = "LSP: Find diagnostics errors" })

    vim.keymap.set("n", "<leader>fp", function()
      snacks.picker()
    end, { desc = "Snacks: Find Pickers" })
  end,
}

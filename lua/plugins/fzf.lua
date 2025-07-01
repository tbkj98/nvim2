local generate_rg_opts = function(opts)
  opts = opts or {}
  local folder_ignore_opts = opts.folder_ignore_opts or {}
  local file_ignore_opts = opts.file_ignore_opts or {}

  local rg_opts = "--hidden --files"

  -- Ignoring folders
  for _, folder_name in ipairs(folder_ignore_opts) do
    rg_opts = rg_opts .. " -g '!" .. folder_name .. "'"
  end

  -- Ignoring files
  for _, file_name in ipairs(file_ignore_opts) do
    rg_opts = rg_opts .. "--ignore-file " .. file_name .. " "
  end

  return rg_opts
end

return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local ignore_folders = { "gradle", ".gradle", "node_modules", ".git", ".settings" }
    local ignore_files = { "package-lock.json" }

    local rg_opts = generate_rg_opts({
      folder_ignore_opts = ignore_folders,
      file_ignore_opts = ignore_files,
    })

    local opts = {
      files = {
        rg_opts = rg_opts,
      },
    }

    local fzf = require("fzf-lua")
    fzf.setup(opts)

    function show_buffer_diagnostics()
      fzf.lsp_document_diagnostics({
        previewer = false,
      })
    end

    function show_workspace_diagnostics()
      fzf.lsp_workspace_diagnostics({
        previewer = false,
      })
    end

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "FZF: Files" })
    vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "FZF: Files (recent)" })
    vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "FZF: Live grep" })
    vim.keymap.set("n", "<leader>fG", fzf.lines, { desc = "FZF: Live grep (open buffers)" })
    vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "FZF: Buffers" })
    vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "FZF: Help tags" })
    vim.keymap.set("n", "<leader>fs", fzf.blines, { desc = "FZF: Search current buffer" })
    vim.keymap.set("n", "<leader>fq", fzf.quickfix, { desc = "FZF: Search quickfix list" })

    vim.keymap.set("n", "<leader>gs", fzf.git_stash, { desc = "Git: Stash" })
    vim.keymap.set("n", "<leader>gg", fzf.git_status, { desc = "Git: Status" })
    vim.keymap.set("n", "<leader>gb", fzf.git_branches, { desc = "Git: Branch" })

    vim.keymap.set("n", "<leader>'", fzf.marks, { desc = "FZF: List marks" })
    vim.keymap.set("n", '<leader>"', fzf.registers, { desc = "FZF: List registers" })

    vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "FZF: List keymaps" })

    vim.keymap.set("n", "<leader><leader>", fzf.command_history, { desc = "FZF: command history" })

    vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "LSP -> Definitions" })
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "LSP -> Rename" })
    vim.keymap.set("n", "<leader>la", fzf.lsp_code_actions, { desc = "FZF: LSP -> Code actions" })
    vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "LSP: Hover" })
    vim.keymap.set("n", "<leader>lI", fzf.lsp_implementations, { desc = "FZF: LSP -> Find implementations" })
    vim.keymap.set("n", "<leader>lR", fzf.lsp_references, { desc = "FZF: LSP -> Find references" })
    vim.keymap.set("n", "<leader>lM", fzf.lsp_document_symbols, { desc = "FZF: LSP -> Find methods" })
    vim.keymap.set("n", "<leader>lF", fzf.lsp_document_symbols, { desc = "FZF: LSP -> Find functions" })
    vim.keymap.set("n", "<leader>le", show_buffer_diagnostics, { desc = "FZF: LSP -> Find diagnostics errors" })
    vim.keymap.set("n", "<leader>lE", show_workspace_diagnostics, { desc = "FZF: LSP -> Find diagnostics errors" })

    vim.keymap.set("n", "<leader>ft", fzf.tabs, { desc = "FZF: Find tabs" })

    -- Registering vim.ui.select
    fzf.register_ui_select()
  end,
}

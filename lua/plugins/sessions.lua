return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    local opts = {
      suppressed_dirs = { "~/", "/" },
      auto_load_session = true,
      bypass_save_filetypes = { "nerdtree" },
      pre_cwd_changed_cmds = {
        "tabdo NERDTreeClose", -- Close NERDTree before saving session
      },
      pre_save_cmds = {
        "tabdo NERDTreeClose", -- Close NERDTree before saving session
      },
    }
    require("auto-session").setup(opts)
  end,
}

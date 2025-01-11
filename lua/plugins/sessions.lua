return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    local opts = {
      suppressed_dirs = { "~/", "/" },
      auto_load_session = true,
    }
    require("auto-session").setup(opts)
  end,
}

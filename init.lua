-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Turn off netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- This has to be set before initializing lazy
vim.g.mapleader = " "

-- Initialize lazy with dynamic loading of anything in the plugins directory
require("lazy").setup("plugins", {
  change_detection = {
    enabled = true, -- automatically check for config file changes and reload the ui
    notify = false, -- turn off notifications whenever plugin changes are made
  },
})

-- These modules are not loaded by lazy
require("core.options")
-- Custom keymaps
require("core.keymaps")
-- User auto commands
require("core.autocommands")
-- Custom plugins
require("custom.recent_files").setup()

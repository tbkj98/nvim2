local opt = vim.opt
-- Session Management
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions,globals"

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 4

-- Line Wrapping
opt.wrap = true

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
vim.diagnostic.config({
  float = { border = "rounded" }, -- add border to diagnostic popups
})

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Disable the mouse while in nvim
opt.mouse = ""

-- Folding
opt.foldmethod = "manual"

-- Always show tabline
vim.o.showtabline = 2
opt.hlsearch = false

-- Spell check
opt.spelllang = "en_us"
opt.spell = true

-- Make block cursor
opt.guicursor = ""

-- Disable swap file
opt.swapfile = false

-- Enable global status line
opt.laststatus = 3

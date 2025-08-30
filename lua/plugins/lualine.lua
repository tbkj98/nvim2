-- Status line
return {
  -- https://github.com/nvim-lualine/lualine.nvim
  "nvim-lualine/lualine.nvim",
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    "nvim-tree/nvim-web-devicons", -- fancy icons
    -- https://github.com/linrongbin16/lsp-progress.nvim
    {
      "linrongbin16/lsp-progress.nvim",
      config = function()
        require("lsp-progress").setup({})
      end,
    },
  },
  opts = {
    options = {
      -- For more themes, see https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
      theme = "tokyonight", -- "auto, tokyonight, catppuccin, codedark, nord"
    },
    sections = {
      lualine_x = {
        "encoding",
        "fileformat",
        "filetype",
      },
      lualine_y = {
        function()
          return require("lsp-progress").progress()
        end,
      },
      lualine_z = { "location" },
      lualine_a = {
        {

          function()
            local reg = vim.fn.reg_recording()
            if reg == "" then
              return ""
            else
              return "@" .. reg
            end
          end,
          color = { fg = "#EB8C67", bg = "#222436", gui = "bold" },
        },
      },
      lualine_c = {
        {
          -- Customize the filename part of lualine to be parent/filename
          "filename",
          file_status = true, -- Displays file status (readonly status, modified status)
          newfile_status = false, -- Display new file status (new file means no write after created)
          path = 3, -- 0: Just the filename
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory
          -- 4: Filename and parent dir, with tilde as the home directory
          symbols = {
            modified = "[+]", -- Text to show when the file is modified.
            readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
          },
        },
      },
    },
  },
  config = function(_, opts)
    require("lualine").setup(opts)

    -- To update LSP Progress in lualine
    vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      group = "lualine_augroup",
      pattern = "LspProgressStatusUpdated",
      callback = require("lualine").refresh,
    })
  end,
}

return {
  "nvim-neorg/neorg",
  version = "*",
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              work = "~/notes/work",
              home = "~/notes/home",
              notes = "~/notes/notes",
            },
          },
        },
      },
    })
  end,
}

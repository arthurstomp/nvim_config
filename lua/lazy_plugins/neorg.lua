local M = {
  "nvim-neorg/neorg",
  lazy = false,      -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*",     -- Pin Neorg to the latest stable release
  config = function()
    require('neorg').setup {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.integrations.telescope"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              journal = "~/journal",
              rayse = "~/work/rayse/journal"
            },
            default_workspace = 'journal'
          }
        }
      }
    }
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-neorg/neorg-telescope" },
  },
}

return M

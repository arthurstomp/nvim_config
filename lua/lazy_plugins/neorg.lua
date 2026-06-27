local M = {
  "nvim-neorg/neorg",
  lazy = true,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "9.4.0", -- Pin Neorg to the latest stable release
  config = function()
    require('neorg').setup {
      load = {
        ["core.defaults"] = {},
        ["core.export"] = {},
        ["core.concealer"] = {},
        ["core.integrations.telescope"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              journal = "~/journal",
              -- rayse = "~/work/rayse/journal",
              -- houndsy = "~/work/houndsy/journal",
              -- monograph = "~/work/monograph/journal"
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
  keys = {
    {
      "<leader>nw",
      ':Telescope neorg switch_workspace<CR>',
      mode = 'n',
      desc = "Switch Workspace",
    },
    {
      "<leader>nh",
      ':Telescope neorg search_headings<CR>',
      mode = 'n',
      desc = "Switch Headings",
    },
    {
      "<leader>nf",
      ':Telescope neorg find_norg_files<CR>',
      mode = 'n',
      desc = "Find files",
    },
    {
      "<leader>ni",
      ':Neorg index<CR>',
      mode = 'n',
      desc = "Index",
    },
    {
      "<leader>nr",
      ':Neorg return<CR>',
      mode = 'n',
      desc = "Return",
    },
    {
      "<leader>ns",
      '<Plug>(neorg.qol.todo-items.todo.task-cycle)',
      mode = 'n',
      desc = "Cycle todo",
    },
  }
}

return M

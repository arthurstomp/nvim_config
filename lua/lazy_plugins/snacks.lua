local snacks = {
  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
      image = {
        enabled = true
      },
      indent = {},
      profiler = {},
      dashboard = {},
      explorer = {},
      picker = {
        sources = {
          explorer = {
            -- your explorer picker configuration comes here
            -- or leave it empty to use the default settings
          }
        }
      },
      ui = {},
      words = {},
      statuscolumn = {},
      scroll = {},
      toggle = {}
    },
    keys = {
      { "<C-n>", function ()
        local Snacks = require('snacks')
        Snacks.explorer()
      end},
    }
    --   opts = function()
    --     local Snacks = require('folk')
    --     -- Toggle the profiler
    --     Snacks.toggle.profiler():map("<leader>pp")
    --     -- Toggle the profiler highlights
    --     Snacks.toggle.profiler_highlights():map("<leader>ph")
    --   end,
    --   keys = {
    --     { "<leader>ps", function() Snacks.profiler.scratch() end, desc = "Profiler Scratch Bufer" },
    --   }
    -- },
  }
}

return snacks

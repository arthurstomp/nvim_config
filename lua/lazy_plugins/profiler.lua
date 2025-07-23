local snack = {
  {
    "folke/snacks.nvim",
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

local M = {
  snack = snack
}

return M

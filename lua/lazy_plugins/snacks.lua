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
      { "<C-n>", function()
        local Snacks = require('snacks')
        Snacks.explorer()
      end },
      {
        "<leader>tF",
        function()
          local Snacks = require('snacks')
          Snacks.picker.smart()
        end,
        desc = "Smart Find Files"
      },
      {
        "<leader>tb",
        function()
          local Snacks = require('snacks')
          Snacks.picker.buffers()
        end,
        desc = "Buffers"
      },
      {
        "<leader>tg",
        function()
          local Snacks = require('snacks')
          Snacks.picker.grep()
        end,
        desc = "Grep"
      },
      -- {
      --   "<leader>:",
      --   function()
      --     Snacks.picker.command_history()
      --   end,
      --   desc = "Command History"
      -- },
      -- {
      --   "<leader>n",
      --   function()
      --     Snacks.picker.notifications()
      --   end,
      --   desc = "Notification History"
      -- },
      {
        "<leader>tc",
        function()
          local Snacks = require('snacks')
          Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find Config File"
      },
      {
        "<leader>tf",
        function()
          local Snacks = require('snacks')
          Snacks.picker.files()
        end,
        desc = "Find File"
      },
      {
        "<leader>tb",
        function()
          local Snacks = require('snacks')
          Snacks.picker.buffers()
        end,
        desc = "Buffers"
      },
      -- { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      -- { "<leader>ff", function() Snacks.picker.files() end,                                   desc = "Find Files" },
      -- { "<leader>fg", function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
      -- { "<leader>fp", function() Snacks.picker.projects() end,                                desc = "Projects" },
      -- { "<leader>fr", function() Snacks.picker.recent() end,                                  desc = "Recent" },
      -- git
      -- { "<leader>gb", function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
      -- { "<leader>gl", function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
      -- { "<leader>gL", function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
      -- { "<leader>gs", function() Snacks.picker.git_status() end,                              desc = "Git Status" },
      -- { "<leader>gS", function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
      -- { "<leader>gd", function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
      -- { "<leader>gf", function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
      -- Grep
      -- { "<leader>sb", function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
      {
        "<leader>tB",
        function()
          local Snacks = require('snacks')
          Snacks.picker.grep_buffers()
        end,
        desc = "Grep Open Buffers"
      },
      {
        "<leader>td",
        function()
          local Snacks = require('snacks')
          Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics"
      },
      {
        "<leader>tD",
        function()
          local Snacks = require('snacks')
          Snacks.picker.diagnostics_buffer()
        end,
        desc = "Buffer Diagnostics"
      },
      {
        "<leader>tr",
        function()
          local Snacks = require('snacks')
          Snacks.picker.lsp_references()
        end,
        nowait = true,               desc = "References"
      },
      {
        "<leader>ti",
        function()
          local Snacks = require('snacks')
          Snacks.picker.lsp_implementations()
        end,
        desc = "Goto Implementation"
      },
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

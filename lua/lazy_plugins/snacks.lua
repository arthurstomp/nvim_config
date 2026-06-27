local snacks_dim_active = false
local snacks = {
  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
      animate = {},
      image = {
        enabled = false
      },
      dim = {},
      scope = { enabled = false },
      bigfile = {},
      bufdelete = {},
      indent = {},
      profiler = {},
      dashboard = {},
      explorer = {},
      picker = {
        enabled = true,
        sources = {
          explorer = {
            enabled = true,
            hidden = true,
            auto_close = false,
            win = {
              list = {
                keys = {
                  ["O"] = { { "pick_win", "jump"}, mode = {"n", "i"}}
                }
              }
            }
          }
        },
        jump = {
          reuse_win = true
        },
        layout = {
          preset="ivy",
          position = "bottom"
        }
      },
      ui = {},
      words = {},
      statuscolumn = {},
      scroll = {},
      toggle = {},
      highlights = {},
      terminal = {
        win = {
          style = "terminal",
        }
      }
    },
    keys = {
      { "<C-n>", function()
        local Snacks = require('snacks')
        Snacks.explorer()
      end,
      desc = "Open Snack Explorer"
    },
      {
        "<leader>tF",
        function()
          local Snacks = require('snacks')
          Snacks.picker.smart({
            matcher = {
              fuzzy = true,
              smartcase = true,
              ignorecase = true,
              history_bonus = true
            }
          })
        end,
        desc = "Smart Find Files"
      },
      {
        "<leader>tR",
        function()
          local Snacks = require('snacks')
          Snacks.picker.registers()
        end,
        desc = "Vim registers"
      },
      {
        "<leader>tb",
        function()
          local Snacks = require('snacks')
          Snacks.picker.buffers({
            matcher = {
              fuzzy = true,
              smartcase = true,
              ignorecase = true,
              history_bonus = true
            }
          })
        end,
        desc = "Buffers"
      },
      {
        "<leader>tg",
        function()
          local Snacks = require('snacks')
          Snacks.picker.grep({
            matcher = {
              fuzzy = true,
              smartcase = true,
              ignorecase = true,
              history_bonus = true
            }
          })
        end,
        desc = "Grep"
      },
      {
        "<leader>n",
        function()
          Snacks.picker.notifications()
        end,
        desc = "Notification History"
      },
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
      {
        "<leader>tB",
        function()
          local Snacks = require('snacks')
          Snacks.picker.grep_buffers()
        end,
        desc = "Grep Open Buffers"
      },
      {
        "<leader>cd",
        function()
          local Snacks = require('snacks')
          Snacks.picker.diagnostics_buffer()
        end,
        desc = "Buffer Diagnostics"
      },
      {
        "<leader>cD",
        function()
          local Snacks = require('snacks')
          Snacks.picker.diagnostics_buffer()
        end,
        desc = "Diagnostics"
      },
      {
        "<leader>cr",
        function()
          local Snacks = require('snacks')
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = "List References"
      },
      {
        "<leader>ci",
        function()
          local Snacks = require('snacks')
          Snacks.picker.lsp_definitions()
        end,
        desc = "Goto Implementation"
      },
      -- git
      -- { "<leader>gb", function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
      {
        "<leader>gl",
        function()
          require('snacks').picker.git_log()
        end,
        desc = "Git Log"
      },
      { "<leader>gL", function() require('snacks').picker.git_log_line() end, desc = "Git Log Line" },
      { "<leader>gs", function() require('snacks').picker.git_status() end,   desc = "Git Status" },
      -- { "<leader>gS", function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
      { "<leader>gF", function() require('snacks').picker.git_diff() end,     desc = "Git Diff (Hunks)" },
      -- { "<leader>gf", function() require('snacks').picker.git_log_file() end, desc = "Git Log File" },
      -- Grep
      -- { "<leader>sb", function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
      {
        "<leader>gf",
        function()
          local Snacks = require('snacks')
          Snacks.picker.lsp_symbols()
        end,
        desc = "Show Symbols"
      },
    }
  }
}

return snacks

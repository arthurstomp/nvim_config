local tidal_spec = {
  'grddavies/tidal.nvim',
  opts = {},
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "haskell", "supercollider" },
      boot = {
        mappings = {
          send_line = { mode = { "i", "n" }, key = "<S-CR>" },
          send_visual = false,
          -- send_block = { mode = { "i", "n", "x" }, key = "<S-CR>" },
          send_node = { mode = "n", key = "<leader><CR>" },
          send_silence = { mode = "n", key = "<leader>d" },
          send_hush = { mode = "n", key = "<leader><Esc>" },

        }
      }
    },
  },
}

local strudel_spec = {
  "gruvw/strudel.nvim",
  build = "npm ci",
  config = function()
    require("strudel").setup()
  end,
}

local M = {
  strudel_spec = strudel_spec,
  tidal_spec = tidal_spec
}

return M

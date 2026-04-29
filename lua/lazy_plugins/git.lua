local neogit = {
  "NeogitOrg/neogit",
  lazy = true,
  keys = {
    { "<leader>ng", "<cmd>Neogit<cr>", desc = "Neogit" },
    {
      'dc',
      ':DiffviewClose<CR>',
      mode = 'n',
      silent = true,
      noremap = true
    }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",        -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = function()
    require('neogit').setup()
  end,
}

local fugitive = {
  "tpope/vim-fugitive",
  cmd = {
    "G",
    "Git",
    "Gdiffsplit",
    "Gread",
    "Gwrite",
    "Ggrep",
    "GMove",
    "GDelete",
    "GBrowse",
    "GRemove",
    "GRename",
    "Glgrep",
    "Gedit"
  },
  lazy = true,
  ft = { "fugitive" }
}

local gitsigns_spec = {
  'lewis6991/gitsigns.nvim',
  config = function() require('gitsigns').setup() end,
  lazy = false,
  keys = {
    {
      "]c",
      function()
        local gitsigns = require('gitsigns')
        gitsigns.nav_hunk("next")
      end,
      desc = "Next git hunk"
    },
    {
      "[c",
      function()
        local gitsigns = require('gitsigns')
        gitsigns.nav_hunk("prev")
      end,
      desc = "Previous git hunk"
    },
    -- {
    --   "<leader>hd",
    --   function()
    --     local gitsigns = require('gitsigns')
    --     gitsigns.diffthis()
    --   end,
    --   desc = "Diff this"
    -- },
    -- {
    --   "<leader>hb",
    --   function()
    --     local gitsigns = require('gitsigns')
    --     gitsigns.toggle_current_line_blame()
    --   end,
    --   desc = "Toggle current line blame"
    -- },
  }
}

local diffview_spec = { "sindrets/diffview.nvim" }

local M = {
  neogit = neogit,
  fugitive = fugitive,
  gitsigns_spec = gitsigns_spec,
  diffview_spec = diffview_spec
}

return M

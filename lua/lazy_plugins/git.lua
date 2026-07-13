local neogit = {
  "NeogitOrg/neogit",
  lazy = true,
  keys = {
    { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
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

local lazygit = {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" }
  }
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

        if vim.wo.diff then
          vim.cmd.normal({ ']c', bang = true })
        else
          gitsigns.nav_hunk('next')
        end
        vim.cmd('normal! zz')
      end,
      desc = "Next git hunk"
    },
    {
      "[c",
      function()
        local gitsigns = require('gitsigns')

        if vim.wo.diff then
          vim.cmd.normal({ '[c', bang = true })
        else
          gitsigns.nav_hunk('prev')
        end
        vim.cmd('normal! zz')
      end,
      desc = "Previous git hunk"
    },
    {
      "<leader>gd",
      function()
        local gitsigns = require('gitsigns')
        gitsigns.diffthis()
      end,
      desc = "Diff this"
    },
    {
      "<leader>gb",
      function()
        local gitsigns = require('gitsigns')
        gitsigns.toggle_current_line_blame()
      end,
      desc = "Toggle current line blame"
    },
    {
      "<leader>gp",
      function()
        local gitsigns = require('gitsigns')
        gitsigns.preview_hunk()
      end,
      desc = "Preview hunk"
    },
    {
      "<leader>gs",
      function()
        local gitsigns = require('gitsigns')
        gitsigns.stage_hunk()
      end,
      desc = "Stage hunk"
    },
    {
      "<leader>gr",
      function()
        local gitsigns = require('gitsigns')
        gitsigns.reset_hunk()
      end,
      desc = "Reset hunk"
    },
  }
}


local diffview_spec = { "sindrets/diffview.nvim" }

local M = {
  neogit = neogit,
  fugitive = fugitive,
  gitsigns_spec = gitsigns_spec,
  diffview_spec = diffview_spec,
  lazygit = lazygit
}

return M

local neogit = {
  "NeogitOrg/neogit",
  lazy = true,
  keys = {
    { "<leader>ng", "<cmd>Neogit<cr>", desc = "Neogit"}
  },
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",        -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = function()
    require('neogit').setup()
  end
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

local M = {
  neogit = neogit,
  fugitive = fugitive
}

return M

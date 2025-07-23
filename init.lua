-- Profile vim startup
if vim.env.PROF then
  -- example for lazy.nvim
  -- change this to the correct path for your plugin manager
  local snacks = vim.fn.stdpath("data") .. "/lazy/snacks.nvim"
  vim.opt.rtp:append(snacks)
  require("snacks.profiler").startup({
    startup = {
      event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
      -- event = "UIEnter",
      -- event = "VeryLazy",
    },
  })
end

-- Change leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
-- vim.o.background = 'dark'
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- show line numbers
vim.wo.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.conceallevel = 2
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99

-- require("lazy_config")
-- require("lazy_plugins")
require('lazy_setup')
require('maps')

vim.cmd[[colorscheme tokyonight-moon]]
vim.notify = require('notify')
vim.filetype.add {
  pattern = {
    ['openapi.ya?ml'] = 'yaml.openapi',
    ['.*.?openapi.json'] = 'json.openapi',
  },
}

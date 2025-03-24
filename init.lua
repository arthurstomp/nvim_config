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

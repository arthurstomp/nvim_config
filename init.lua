-- Change leader to space
vim.g.mapleader = ' '
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

require('plugins')
require('setup')
require('lsp_zero')
require('maps')
-- require('null_ls')
-- require("dap_config")
require ('treesitter_fold')

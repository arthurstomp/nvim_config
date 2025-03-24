local tokyonight = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}

local ayu = {
  'Shatur/neovim-ayu',
  config = function()
    require('ayu').setup({ mirage = true })
  end
}

local navic = { 'SmiteshP/nvim-navic' }

local M = {
  tokyonight = tokyonight,
  ayu = ayu,
  navic = navic
}

return M

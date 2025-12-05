local spec = {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      options = {
        theme = 'auto',
      },
      inactive_sections = {
        lualine_c = { { 'filename', path = 1 } },
      }
    })
  end,
  dependencies = {
    'kyazdani42/nvim-web-devicons',
    opt = true
  }
}

return spec

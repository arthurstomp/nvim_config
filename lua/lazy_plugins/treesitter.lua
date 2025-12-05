local M = {
  'nvim-treesitter/nvim-treesitter',
  run = function()
    -- local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    -- ts_update()
  end,
  config = function()
    require('nvim-treesitter.configs').setup({
      auto_install = true,
      ensure_installed = {
        'html',
        'javascript',
        'typescript',
        'css',
        'lua',
        'markdown',
        'ruby',
        'diff',
        'haskell',
        'supercollider'
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      autotag = {
        enable = true,
        filetypes = {
          'html',
          'javascript',
          'typescript',
          'javascriptreact',
          'typescriptreact',
          'tsx',
          'jsx',
          'css',
          'lua',
          'markdown',
          'ruby',
          'diff'
        },
      },
      indent = { enable = true },
    })
  end,
}

return M

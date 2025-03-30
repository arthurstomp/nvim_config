return {
  luasnip = {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      "rafamadriz/friendly-snippets"
    },
    config = function()
      local ls = require('luasnip')
      ls.setup({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true
      })
      require("luasnip.loaders.from_vscode").lazy_load()
      require('snippets/all')
      require('snippets/ruby')
    end
  }
}

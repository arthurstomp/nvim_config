local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- see :help lsp-zero-guide:integrate-with-mason-nvim
-- to learn how to use mason.nvim with lsp-zero
require('mason').setup({})
local lspconfig = require('lspconfig')
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
    solargraph = function()
      lspconfig.solargraph.setup({
        root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
        settings = {
          solargraph = {
            autoformat = false,
            formatting = false,
            completion = true,
            diagnostic = true,
            folding = true,
            references = true,
            rename = true,
            symbols = true
          }
        }
      })
    end
  }
})

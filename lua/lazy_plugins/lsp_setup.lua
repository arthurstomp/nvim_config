local lsp = {
  'neovim/nvim-lspconfig',
  cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
  },
  init = function()
    -- Reserve a space in the gutter
    -- This will avoid an annoying layout shift in the screen
    vim.opt.signcolumn = 'yes'
  end,
  config = function()
    local lsp_defaults = require('lspconfig').util.default_config

    -- Add cmp_nvim_lsp capabilities settings to lspconfig
    -- This should be executed before you configure any language server
    lsp_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lsp_defaults.capabilities,
      require('cmp_nvim_lsp').default_capabilities()
    )

    -- LspAttach is where you enable features that only work
    -- if there is a language server active in the file
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
      end,
    })

    local util = require 'lspconfig.util'
    -- vim.lsp.config('solargraph', {
    --   cmd = { os.getenv("HOME") .. "/.asdf/shims/solargraph", 'stdio' },
    --   settings = {
    --     solargraph = {
    --       useBundler = false,
    --     },
    --     root_dir = util.root_pattern('.git', 'Gemfile', '.', '/home/stomp/work/monograph/code/monograph/apps/api'),
    --   },
    -- })
    -- vim.lsp.enable('solargraph')
    vim.lsp.config('ruby_lsp', {
      -- cmd = { os.getenv("HOME") .. "/.asdf/shims/ruby-lsp", 'stdio' },
    })
    vim.lsp.enable('ruby_lsp')

    -- require('mason').setup({
    --   ensure_installed = { 'lua_ls', 'eslint', 'ts_ls', 'prettier', 'standardrb', 'solargraph', 'erb-formatter' },
    -- })
    -- require('mason-lspconfig').setup({
    --   ensure_installed = { 'lua_ls', 'eslint', 'ts_ls', 'standardrb', 'solargraph' },
    --   handlers = {
    --     -- this first function is the "default handler"
    --     -- it applies to every language server without a "custom handler"
    --     function(server_name)
    --       -- require('lspconfig')[server_name].setup({})
    --       -- require('lspconfig')['eslint'].setup({})
    --       -- require('lspconfig')['tailwindcss'].setup({})
    --       -- require('lspconfig')['erb-formatter'].setup({})
    --       -- require('lspconfig').standardrb.setup({enabled = false})
    --       require('lspconfig')['solargraph'].setup(
    --         {
    --           cmd = { '/home/stomp/.asdf/shims/solargraph', 'stdio' },
    --           settings = {
    --             solargraph = {
    --               diagnostics = true,
    --             },
    --           },
    --           init_options = { formatting = false },
    --           filetypes = { 'ruby' },
    --           root_dir = util.root_pattern('Gemfile', '.git'),
    --         }
    --       )
    --       require('lspconfig')['ruby_lsp'].setup({ enabled = false })
    --       require('lspconfig').lua_ls.setup({
    --         settings = {
    --           diagnostics = {
    --             globals = {
    --               'vim'
    --             }
    --           }
    --         }
    --       })
    --     end,
    --   }
    -- })
  end,
  keys = {
    {
      '<leader>l',
      ':LspRestart<CR>',
      mode = 'n',
      desc = 'Restart LSP.'
    },
    {
      '<leader>i',
      ':lua vim.diagnostic.open_float()<CR>',
      mode = 'n',
      desc = 'Open diagnostics.'
    },
  }
}
local mason = {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason-lspconfig").setup {
      ensure_installed = { 'lua_ls', 'eslint', 'ts_ls', 'standardrb' }
    }
  end
}

local M = {
  lsp = lsp,
  mason = mason
}

return M

local specter_spec = {
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("spectre").setup({ is_block_ui_break = true })
  end,
  keys = {
    {
      '<leader>S',
      function()
        require("spectre").toggle()
      end,
      mode = 'n'
    },
    {
      '<leader>sw',
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      mode = 'n'
    },
    {
      '<leader>sw',
      function()
        require("spectre").open_visual()
      end,
      mode = 'v'
    },
    {
      '<leader>sp',
      function()
        require("spectre").open_file_search({ select_word = true })
      end,
      mode = 'n'
    },
  }
}


local undotree_spec = {
  'mbbill/undotree',
  keys = {
    {
      '<leader>u',
      function()
        vim.cmd.UndotreeToggle()
      end,
      mode = 'n'
    }
  }
}

local autopair_spec = {
  "windwp/nvim-autopairs",
  config = function() require("nvim-autopairs").setup {} end
}

local surround_spec = {
  "tpope/vim-surround",

  -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
  setup = function()
    vim.o.timeoutlen = 500
  end
}

local tabular_spec = { 'godlygeek/tabular' }

local peekup_spec = { "gennaro-tedesco/nvim-peekup" }

local conform_spec = {
  'stevearc/conform.nvim',
  config = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua", "lua_ls", stop_after_first = true },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        ruby = { "rubocop", args = { "--server", "--auto-correct", "--stderr", "--force-exclusion", "--stdin", "$FILENAME" } },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
  opts = {
  },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      mode = { 'n', 'v' },
      desc = 'Format file'
    }
  }
}

local luasnip_spec = {
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
      require('snippets/typescript')
    end,
    keys = {
      {
        "<c-k>",
        function()
          local ls = require('luasnip')
          if ls.expand_or_jumpable() then
            ls.expand_or_jump()
          end
        end,
        mode = { "i", "s" },
        silent = true
      },
      {
        "<c-j>",
        function()
          local ls = require('luasnip')
          if ls.jumpable(-1) then
            ls.jump(-1)
          end
        end,
        mode = { "i", "s" },
        silent = true
      },
      {
        "<c-l>",
        function()
          local ls = require('luasnip')
          if ls.choice_active() then
            ls.change_choice(1)
          end
        end,
        mode = { "i", "s" },
        silent = true
      }
    }
  }
}

local treesitter_spec = {
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

local autocomplete_spec = {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = function()
    local cmp = require('cmp')

    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
      }),
      snippet = {
        expand = function(args)
          -- vim.snippet.expand(args.body)
          require('luasnip').lsp_expand(args.body)
        end,
      },
    })
  end
}

local M = {
  specter_spec = specter_spec,
  undotree_spec = undotree_spec,
  autopair_spec = autopair_spec,
  surround_spec = surround_spec,
  tabular_spec = tabular_spec,
  peekup_spec = peekup_spec,
  conform_spec = conform_spec,
  luasnip_spec = luasnip_spec,
  treesitter_spec = treesitter_spec,
  autocomplete_spec = autocomplete_spec
}

return M

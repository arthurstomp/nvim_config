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

local M = {
  specter_spec = specter_spec,
  undotree_spec = undotree_spec,
  autopair_spec = autopair_spec,
  surround_spec = surround_spec,
  tabular_spec = tabular_spec,
  peekup_spec = peekup_spec,
  conform_spec = conform_spec
}

return M

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
  spec = {
    require('lazy_plugins.snacks'),
    require('lazy_plugins/telescope').telescope_spec,
    require('lazy_plugins/telescope').telescope_fzf_native_spec,
    require('lazy_plugins.lualine'),
    require('lazy_plugins/treesitter'),
    require('lazy_plugins/lsp_setup').lsp,
    require('lazy_plugins/lsp_setup').mason,
    require('lazy_plugins/git').neogit,
    require('lazy_plugins/git').fugitive,
    require('lazy_plugins/neorg'),
    require('lazy_plugins/autocomplete'),
    require('lazy_plugins/luasnip').luasnip,
    -- require('lazy_plugins/ai').claude,
    require('lazy_plugins/ai').avante,
    -- require('lazy_plugins/ai').gp,
    -- require('lazy_plugins/ai').aider2,
    require('lazy_plugins/colors').tokyonight,
    require('lazy_plugins/colors').ayu,
    require('lazy_plugins/colors').navic,
    {
      'nvim-pack/nvim-spectre',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require("spectre").setup({ is_block_ui_break = true })
      end
    },
    { 'nvim-lua/plenary.nvim' },
    {
      'akinsho/bufferline.nvim',
      dependencies = 'nvim-tree/nvim-web-devicons',
      config = function()
        require("bufferline").setup()
      end
    },
    {
      "akinsho/toggleterm.nvim",
      config = function()
        require("toggleterm").setup()
      end
    },
    {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    },
    {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      ft = "markdown",
      config = function()
        vim.g.mkdp_auto_start = 1
      end,
    },
    {
      "tpope/vim-surround",

      -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
      setup = function()
        vim.o.timeoutlen = 500
      end
    },
    {
      "terrortylor/nvim-comment",
      config = function()
        require('nvim_comment').setup()
      end
    },
    { 'simeji/winresizer' },
    { 'godlygeek/tabular' },
    { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end },
    { "ThePrimeagen/harpoon" },
    {
      'mbbill/undotree'
    },
    {
      "AckslD/nvim-neoclip.lua",
      dependencies = {
        { 'kkharji/sqlite.lua', module = 'sqlite' },
        -- you'll need at least one of these
        -- {'nvim-telescope/telescope.nvim'},
        -- {'ibhagwan/fzf-lua'},
      },
      config = function()
        require('neoclip').setup()
      end,
    },
    { "rcarriga/nvim-notify" },
    -- { 'wakatime/vim-wakatime',      lazy = false },
    { "gennaro-tedesco/nvim-peekup" },
    {
      "brenoprata10/nvim-highlight-colors",
      config = function()
        require('nvim-highlight-colors').setup({})
      end
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      enabled = false,
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },
    {
      "itchyny/calendar.vim",
    },
    {
      'stevearc/conform.nvim',
      config = function()
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
      }
    },
    {
      "3rd/diagram.nvim",
      dependencies = {
        {
          "3rd/image.nvim",
          opts = {
            processor = "magick_cli"
          },
        }, -- you'd probably want to configure image.nvim manually instead of doing this
      },
      opts = {
        events = {
          render_buffer = {},
          clear_buffer = { "BufLeave" }
        },
        renderer_options = {
          mermaid = {
            background = "transparent",
            cli_args = { "-b", "transparent" }
          }
        }
      },
      config = function()
        require("diagram").setup({
          integrations = {
            require("diagram.integrations.markdown"),
            require("diagram.integrations.neorg"),
          },
        })
      end,
      keys = {
        {
          "M", -- or any key you prefer
          function()
            require("diagram").show_diagram_hover()
          end,
          mode = "n",
          ft = { "markdown", "norg" }, -- Only in these filetypes
          desc = "Show diagram in new tab",
        },
      },
    },
    {
      'grddavies/tidal.nvim',
      opts = {},
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        opts = {
          ensure_installed = { "haskell", "supercollider" },
          boot = {
            mappings = {
              send_line = { mode = { "i", "n" }, key = "<S-CR>" },
              send_visual = false,
              -- send_block = { mode = { "i", "n", "x" }, key = "<S-CR>" },
              send_node = { mode = "n", key = "<leader><CR>" },
              send_silence = { mode = "n", key = "<leader>d" },
              send_hush = { mode = "n", key = "<leader><Esc>" },

            }
          }
        },
      },
    },
    {
      "gruvw/strudel.nvim",
      build = "npm ci",
      config = function()
        require("strudel").setup()
      end,
    }
  },
})

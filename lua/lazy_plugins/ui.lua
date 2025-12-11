local harpoon_spec = {
  "ThePrimeagen/harpoon",
  keys = {
    {
      '<leader>ha',
      function()
        require('harpoon.mark').add_file()
      end,
      mode = 'n'
    },
    {
      '<leader>hh',
      function()
        require('harpoon.ui').toggle_quick_menu()
      end,
      mode = 'n'
    },
  }
}

local toggle_term_spec = {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup()
  end,
  keys = {
    {
      '<M-1>',
      ':ToggleTerm size=80 direction=vertical<CR>',
      mode = 'n',
      noremap = true
    },
    {
      '<M-2>',
      ':ToggleTerm size=80 direction=horizontal<CR>',
      mode = 'n',
      noremap = true
    },
    {
      '<ESC>',
      '<C-\\><C-n>',
      mode = 't',
      desc = 'Exit terminal mode.'
    },
  }
}

local notify_spec = {
  "rcarriga/nvim-notify",
  keys = {
    {
      '<leader>k',
      function() require('notify').dismiss { pending = true, silent = true } end,
      mode = 'n',
      desc = 'Clear notifications.'
    },
  }
}

local winresizer_spec = { 'simeji/winresizer' }

local plenary_spec = { 'nvim-lua/plenary.nvim' }

local bufferline_spec = {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup()
  end
}

local markdown_preview_spec = {
  "iamcco/markdown-preview.nvim",
  run = "cd app && npm install",
  ft = "markdown",
  config = function()
    vim.g.mkdp_auto_start = 1
  end,
}

local highlight_colors_spec = {
  "brenoprata10/nvim-highlight-colors",
  config = function()
    require('nvim-highlight-colors').setup({})
  end
}

local diagram_spec = {
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
}

local which_key_spec = {
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
}

local M = {
  harpoon_spec = harpoon_spec,
  toggle_term_spec = toggle_term_spec,
  notify_spec = notify_spec,
  winresizer_spec = winresizer_spec,
  plenary_spec = plenary_spec,
  bufferline_spec = bufferline_spec,
  markdown_preview_spec = markdown_preview_spec,
  highlight_colors_spec = highlight_colors_spec,
  diagram_spec = diagram_spec,
  which_key_spec = which_key_spec
}

return M

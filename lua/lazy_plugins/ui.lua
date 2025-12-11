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
    triggers = {},
    preset = 'helix',
    plugins = {},
  },
  config = function()
    local wk = require('which-key')
    wk.add({
      { '<leader>t', group = 'Explore' }
    })
  end,
  keys = {
    {
      "<leader>wk",
      function()
        require("which-key").show({ global = true })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

local calendar_spec = {
  "itchyny/calendar.vim",
}

local lualine_spec = {
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

local telescope_spec = {
  'nvim-telescope/telescope.nvim',
  dependencies = { { 'nvim-lua/plenary.nvim' } },
  config = function()
    local telescope = require('telescope')
    telescope.setup {
      defaults = {
        file_ignore_patterns = { ".git", "node_modules" },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
      }
    }
    -- telescope.load_extension('fzf')
    -- telescope.load_extension('neoclip')
    -- telescope.load_extension('harpoon')
  end
}

-- NOTE: Commented in case i need FZF on telescope
-- local telescope_fzf_native_spec = {
--   'nvim-telescope/telescope-fzf-native.nvim',
--   build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
-- }

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
  which_key_spec = which_key_spec,
  calendar_spec = calendar_spec,
  lualine_spec = lualine_spec,
  telescope_spec = telescope_spec
}

return M

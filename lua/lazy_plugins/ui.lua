local harpoon_spec = {
  "ThePrimeagen/harpoon",
  keys = {
    {
      '<leader>ha',
      function()
        require('harpoon.mark').add_file()
      end,
      mode = 'n',
      desc = "Add to Harpoon"
    },
    {
      '<leader>hh',
      function()
        require('harpoon.ui').toggle_quick_menu()
      end,
      mode = 'n',
      desc = "Toggle Harpoon"
    },
  }
}

local winresizer_spec = { 'simeji/winresizer' }
local bufresize_spec = {
  "kwkarlwang/bufresize.nvim",
  config = function()
    require("bufresize").setup()
  end,
  keys = {
    {
      '<M-S-h>',
      '30<C-w><',
      mode = 'n',
      desc = 'Increase buffer left'
    },
    {
      '<M-S-l>',
      '30<C-w>>',
      mode = 'n',
      desc = 'Increase buffer right'
    },
    {
      '<M-S-k>',
      '10<C-w>+',
      mode = 'n',
      desc = 'Increase buffer height'
    },
    {
      '<M-S-j>',
      '10<C-w>-',
      mode = 'n',
      desc = 'Decrease buffer height'
    },
  }
}

local plenary_spec = { 'nvim-lua/plenary.nvim' }

local scope = { "tiagovla/scope.nvim", config = true }

local bufferline_spec = {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  version = "*",
  lazy = false,
  config = function()
    require("bufferline").setup({})
  end,
  keys = {
    {
      "<leader>br",
      "<cmd>BufferLineCloseRight</CR>",
      mode = 'n',
      desc = 'Close buffers to the right'
    },
  }
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
    require('nvim-highlight-colors').setup({
      render = 'virtual',
      virtual_symbol = "",
      enable_tailwind = true,
    })
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
  opts = {
    preset = "helix",   -- Modern and clean visual layout
    delay = 300,        -- Wait 300ms before showing the popup
    plugins = {
      marks = true,     -- Show marks on ' and `
      registers = true, -- Show registers
      spelling = {
        enabled = true, -- Show suggestions when using z=
        suggestions = 20,
      },
    },
    icons = {
      mappings = true, -- Enable icons for mapped keys
    },
    spec = {
      -- ["<leader>s"] = { group = "Specter - Search/Replace Tool" }
      { "<leader>s", group = "Specter - Search/Replace Tool" },
      { "<leader>g", group = "Git" },
      { "<leader>t", group = "Snack Explorer" },
      { "<leader>b", group = "Buffer Utils" },
      { "<leader>h", group = "Harpoon" },
      { "<leader>c", group = "Code" },
      { "<leader>k", group = "Notification Utils" },
      { "<leader>n", group = "Neorg" }
    },
    triggers = {
      { "<leader>", mode = { "n", "v" } },
      { "<auto>", mode = "nixsotc" },
    }
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

local newscroll_spec = {
  "karb94/neoscroll.nvim",
  opts = {},
}

local M = {
  harpoon_spec = harpoon_spec,
  winresizer_spec = winresizer_spec,
  plenary_spec = plenary_spec,
  bufferline_spec = bufferline_spec,
  markdown_preview_spec = markdown_preview_spec,
  highlight_colors_spec = highlight_colors_spec,
  diagram_spec = diagram_spec,
  which_key_spec = which_key_spec,
  calendar_spec = calendar_spec,
  lualine_spec = lualine_spec,
  telescope_spec = telescope_spec,
  bufresize_spec = bufresize_spec,
  newscroll_spec = newscroll_spec,
  scope = scope
}

return M

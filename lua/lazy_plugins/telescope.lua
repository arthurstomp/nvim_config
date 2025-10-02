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
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
      }
    }
    -- telescope.load_extension('fzf')
    telescope.load_extension('neoclip')
    -- telescope.load_extension('harpoon')
  end
}

local telescope_fzf_native_spec = {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
}

local M = {
  telescope_spec = telescope_spec,
  telescope_fzf_native_spec = telescope_fzf_native_spec
}

return M

require('ayu').setup({ mirage = true })
require('ayu').colorscheme()
require('lualine').setup({
  options = {
    theme = 'ayu',
  },
})

require("nvim-tree").setup()
require("bufferline").setup()
require('gitsigns').setup()
require('nvim_comment').setup()
-- require("luasnip/loaders/from_vscode").lazy_load()
require('telescope').setup {
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
-- require('telescope').load_extension('fzf')
require("telescope").load_extension('harpoon')

local options = {
  auto_install = true,
  ensure_installed = {
    "lua",
    "vim",
    "go",
    "toml",
    "css",
    "tsx",
    "css",
    "html",
    "typescript",
    "javascript",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  autotag = {
    enable = true,
    filetypes = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
      'css', 'lua', 'xml', 'php', 'markdown'
    },
  },
  indent = { enable = true },
}
require'nvim-treesitter.configs'.setup(options)
-- require'iron'

local neogit = require('neogit')
neogit.setup {}
require('telescope').load_extension('neoclip')

vim.notify = require('notify')

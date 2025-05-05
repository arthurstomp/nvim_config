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
    require('lazy_plugins/telescope').telescope_spec,
    require('lazy_plugins/telescope').telescope_fzf_native_spec,
    require('lazy_plugins.lualine'),
    require('lazy_plugins/treesitter'),
    require('lazy_plugins/lsp').lsp,
    require('lazy_plugins/lsp').mason,
    require('lazy_plugins/git').neogit,
    require('lazy_plugins/git').fugitive,
    require('lazy_plugins/neorg'),
    require('lazy_plugins/dashboard'),
    require('lazy_plugins/autocomplete'),
    require('lazy_plugins/luasnip').luasnip,
    require('lazy_plugins/ai').gp,
    require('lazy_plugins/ai').aider2,
    require('lazy_plugins/colors').tokyonight,
    require('lazy_plugins/colors').ayu,
    require('lazy_plugins/colors').navic,
    { 'nvim-pack/nvim-spectre', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'nvim-lua/plenary.nvim' },
    {
      'nvim-tree/nvim-tree.lua',
      dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      config = function()
        require("nvim-tree").setup()
      end
    },
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
    { 'mbbill/undotree' },
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
    { 'wakatime/vim-wakatime',      lazy = false },
    { "karb94/neoscroll.nvim",      opts = {} },
    { "gennaro-tedesco/nvim-peekup" },
  },
})

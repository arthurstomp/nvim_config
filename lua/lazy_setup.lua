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
    require('lazy_plugins/lsp_setup').lsp,
    require('lazy_plugins/lsp_setup').mason,
    require('lazy_plugins/git').neogit,
    require('lazy_plugins/git').fugitive,
    require('lazy_plugins/git').gitsigns_spec,
    require('lazy_plugins/neorg'),
    require('lazy_plugins/ai').avante,
    require('lazy_plugins/colors').tokyonight,
    require('lazy_plugins/colors').ayu,
    require('lazy_plugins/colors').navic,
    require('lazy_plugins/text_manipulation').specter_spec,
    require('lazy_plugins/text_manipulation').undotree_spec,
    require('lazy_plugins/text_manipulation').autopair_spec,
    require('lazy_plugins/text_manipulation').surround_spec,
    require('lazy_plugins/text_manipulation').tabular_spec,
    require('lazy_plugins/text_manipulation').peekup_spec,
    require('lazy_plugins/text_manipulation').conform_spec,
    require('lazy_plugins/text_manipulation').luasnip_spec,
    require('lazy_plugins/text_manipulation').treesitter_spec,
    require('lazy_plugins/text_manipulation').autocomplete_spec,
    require('lazy_plugins/ui').harpoon_spec,
    require('lazy_plugins/ui').toggle_term_spec,
    require('lazy_plugins/ui').notify_spec,
    require('lazy_plugins/ui').winresizer_spec,
    require('lazy_plugins/ui').plenary_spec,
    require('lazy_plugins/ui').bufferline_spec,
    require('lazy_plugins/ui').markdown_preview_spec,
    require('lazy_plugins/ui').highlight_colors_spec,
    require('lazy_plugins/ui').diagram_spec,
    require('lazy_plugins/ui').which_key_spec,
    require('lazy_plugins/ui').lualine_spec,
    require('lazy_plugins/ui').calendar_spec,
    require('lazy_plugins/fun').strudel_spec,
    require('lazy_plugins/fun').tidal_spec,
  },
})

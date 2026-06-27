-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Map Esc to kk
-- map('i', 'kk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>h', ':nohl<CR>', { desc = "Clear search highlight"})

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map('n', '<S-l>', ':BufferLineCycleNext<CR>')
map('n', '<S-h>', ':BufferLineCyclePrev<CR>')
map('n', '<M-l>', ':tabnext<CR>')
map('n', '<M-h>', ':tabprev<CR>')
map('n', '<leader>bd', ':bd<CR>', { desc = "Close buffer"})

vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Toggle line comment" })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, desc = "Toggle selection comment" })

vim.keymap.set('n', '<leader>bp', ':BufferLineTogglePin<CR>', { desc = "Pin buffer to beginning of line" })
vim.keymap.set('n', '<leader>bc', ':BufferLineCloseOthers<CR>', { desc = "Close all buffers but one" })
vim.keymap.set('n', '<leader>br', ':BufferLineCloseRight<CR>', { desc = "Close buffers to the right" })
vim.keymap.set('n', '<leader>e', ":let @+ = expand('%:.')<CR>",
  { desc = "Copy current buffer relative filepath to clipboard" })

vim.api.nvim_set_keymap('v', '<Leader>w', '"+y', { noremap = true, silent = true, desc = "Copy selection to clipboard" })
vim.api.nvim_set_keymap('v', '<Leader>W', '"+Y', { noremap = true, silent = true, desc = "Copy selected lines to clipboard"})
vim.api.nvim_set_keymap('n', '<Leader>W', '"+Y', { noremap = true, silent = true, desc = "Copy line to clipboard" })

vim.keymap.set('n', '<Leader>z', function()
  require('lazy_plugins.wttr').wttr()
end, { noremap = true, silent = true, desc = "Weather forecast" })

ToggleTerm = function(direction)
  local terminal = require('snacks').terminal
  local opts = {}
  if direction == "horizontal" then
    opts = {
      win = {
        position = "bottom",
      }
    }
  elseif direction == "vertical" then
    opts = {
      win = {
        position = "right",
      }
    }
  end
  terminal.toggle(nil, opts)
end
local toggle_term_horizontal = function() ToggleTerm("horizontal") end
local toggle_term_vertical = function() ToggleTerm("vertical") end
vim.keymap.set("n", "<M-1>", toggle_term_vertical, { noremap = true, silent = true })
vim.keymap.set("n", "<M-2>", toggle_term_horizontal, { noremap = true, silent = true })

vim.keymap.set({ "n", "x" }, "<leader>ca", function()
  require("tiny-code-action").code_action()
end, { noremap = true, silent = true, desc = "Tiny code actions" })

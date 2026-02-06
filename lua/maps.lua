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
map('n', '<leader>h', ':nohl<CR>')

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
map('n', '<leader>c', ':bd<CR>')
map('n', '<leader>C', ':Bufonly<CR>')


map('n', '<leader>r', ':WinResizerStartResize <CR>')

vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Toggle line comment" })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, desc = "Toggle selection comment" })

vim.keymap.set('n', '<leader>bp', ':BufferLineTogglePin<CR>', { desc = "Pin buffer to beginning of line" })
vim.keymap.set('n', '<leader>bc', ':BufferLineCloseOthers<CR>', { desc = "Close all buffers but one" })
vim.keymap.set('n', '<leader>br', ':BufferLineCloseRight<CR>', { desc = "Close buffers to the right" })
vim.keymap.set('n', '<leader>e', ":let @+ = expand('%:.')<CR>",
  { desc = "Copy current buffer relative filepath to clipboard" })

vim.api.nvim_set_keymap('v', '<Leader>w', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>W', '"+Y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>W', '"+Y', { noremap = true, silent = true })

vim.keymap.set('n', '<Leader>z', function()
  require('lazy_plugins.wttr').wttr()
end, { noremap = true, silent = true })

ToggleTerm = function(direction)
  require('toggleterm')
  local command = "ToggleTerm"
  if direction == "horizontal" then
    command = command .. " direction=horizontal size=60"
  elseif direction == "vertical" then
    command = command .. " direction=vertical size=60"
  end
  if vim.bo.filetype == "toggleterm" then
    require("bufresize").block_register()
    vim.api.nvim_command(command)
    require("bufresize").resize_close()
  else
    require("bufresize").block_register()
    vim.api.nvim_command(command)
    require("bufresize").resize_open()
    vim.cmd([[execute "normal! i"]])
  end
end
local toggle_term_horizontal = function() ToggleTerm("horizontal") end
local toggle_term_vertical = function() ToggleTerm("vertical") end
vim.keymap.set("n", "<M-1>", toggle_term_vertical, { noremap = true, silent = true })
vim.keymap.set("n", "<M-2>", toggle_term_horizontal, { noremap = true, silent = true })

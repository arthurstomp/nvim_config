---@diagnostic disable: different-requires
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

-- Clear search highlighting with <leader> and c
map('n', '<leader>h', ':nohl<CR>', { desc = "Clear search highlight" })

-- Move around diagnostics
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump({ count = 1, float = true })
  vim.cmd('normal! zz')
end, { desc = "Next diagnostic" })
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump({ count = -1, float = true })
  vim.cmd('normal! zz')
end, { desc = "Prev diagnostic" })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search match (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev search match (centered)' })

-- Toggle fold recursively under cursor
map('n', '<leader>fa', 'zA', { desc = "Toggle fold recursively" })

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Move around Buffers with Shift + {l,h}
map('n', '<S-l>', ':BufferLineCycleNext<CR>')
map('n', '<S-h>', ':BufferLineCyclePrev<CR>')
-- Move around Tabs with Alt + {l,h}
map('n', '<M-l>', ':tabnext<CR>')
map('n', '<M-h>', ':tabprev<CR>')
-- Move around Tabs with Alt + {l,h}
map('n', '<leader>bd', ':bd<CR>', { desc = "Close buffer" })
map('n', '<leader>%', ':vsplit<CR>', { desc = "Split Vertical" })
map('n', '<leader>-', ':split<CR>', { desc = "Split Horizontally" })

vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Toggle line comment" })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, desc = "Toggle selection comment" })

vim.keymap.set('n', '<leader>bp', ':BufferLineTogglePin<CR>', { desc = "Pin buffer to beginning of line" })
vim.keymap.set('n', '<leader>bc', ':BufferLineCloseOthers<CR>', { desc = "Close all buffers but one" })
vim.keymap.set('n', '<leader>br', ':BufferLineCloseRight<CR>', { desc = "Close buffers to the right" })

vim.keymap.set('n', '<leader>e', ":let @+ = expand('%:.')<CR>",
  { desc = "Copy current buffer relative filepath to clipboard" })

vim.api.nvim_set_keymap('v', '<Leader>w', '"+y', { noremap = true, silent = true, desc = "Copy selection to clipboard" })
vim.api.nvim_set_keymap('v', '<Leader>W', '"+Y',
  { noremap = true, silent = true, desc = "Copy selected lines to clipboard" })
vim.api.nvim_set_keymap('n', '<Leader>W', '"+Y', { noremap = true, silent = true, desc = "Copy line to clipboard" })
map("n", "p", '"0p', { desc = "Paste last yank" })
map("n", "P", '"0P', { desc = "Paste last yank before" })
map("x", "p", '"_dP', { desc = "Paste over selection, preserve yank" })

-- restore access to "last deleted/changed thing" explicitly
map("n", "gp", '""p', { desc = "Paste unnamed register (last yank OR delete)" })

vim.keymap.set('n', '<Leader>z', function()
  require('lazy_plugins.wttr').wttr()
end, { noremap = true, silent = true, desc = "Weather forecast" })

local toggle_term_horizontal = function()
  require('snacks').terminal.toggle(nil, { win = { position = "horizontal" } })
end
local toggle_term_vertical = function()
  require('snacks').terminal.toggle(nil, { win = { position = "right" } })
end

vim.keymap.set("n", "<M-1>", toggle_term_vertical, { noremap = true, silent = true })
vim.keymap.set("n", "<M-2>", toggle_term_horizontal, { noremap = true, silent = true })

vim.keymap.set({ "n", "x" }, "<leader>ca", function()
  require("tiny-code-action").code_action()
end, { noremap = true, silent = true, desc = "Tiny code actions" })

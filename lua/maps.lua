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

-- Toggle auto-indenting for code paste
-- map('n', '<F2>', ':set invpaste paste?<CR>')

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

-- Reload configuration without restart nvim
-- map('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>')

map('n', '<leader>r', ':WinResizerStartResize <CR>')

-- Fast saving with <leader> and s
-- map('n', '<leader>s', ':w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
-- map('n', '<leader>q', ':qa!<CR>')
map('n', '<leader>c', ':bd<CR>')
map('n', '<leader>C', ':Bufonly<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Toggle line comment" })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, desc = "Toggle selection comment" })

vim.keymap.set('n', '<leader>nw', ':Telescope neorg switch_workspace<CR>')
vim.keymap.set('n', '<leader>nh', ':Telescope neorg search_headings<CR>')
vim.keymap.set('n', '<leader>nf', ':Telescope neorg find_norg_files<CR>')
vim.keymap.set('n', '<leader>ni', ':Neorg index<CR>')
vim.keymap.set('n', '<leader>nr', ':Neorg return<CR>')
vim.keymap.set('n', '<leader>ns', '<Plug>(neorg.qol.todo-items.todo.task-cycle)')

vim.keymap.set('n', '<leader>bp', ':BufferLineTogglePin<CR>', { desc = "Pin buffer to beginning of line" })
vim.keymap.set('n', '<leader>bc', ':BufferLineCloseOthers<CR>', { desc = "Close all buffers but one" })

-- Show all diagnostics on current line in floating window
vim.api.nvim_set_keymap(
  'n', '<Leader>i', ':lua vim.diagnostic.open_float()<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n', '<Leader>>', ':tabnext<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n', '<Leader><', ':tabprevious<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n', '<Leader>x', ':tabclose<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n', '<Leader>N', ':tabnew<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('v', '<Leader>w', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>W', '"+Y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>W', '"+Y', { noremap = true, silent = true })

vim.keymap.set('n', '<Leader>z', function()
  require('lazy_plugins.wttr').wttr()
end, { noremap = true, silent = true })

vim.keymap.set('n', 'dc', ':DiffviewClose<CR>', { noremap = true, silent = true })

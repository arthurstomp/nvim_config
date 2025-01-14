-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Map Esc to kk
map('i', 'kk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>h', ':nohl<CR>')

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')
-- vim.opt.pastetoggle = '<F2>'

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>')

map('n', '<leader>r', ':WinResizerStartResize <CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')
map('n', '<leader>c', ':bd<CR>')
map('n', '<leader>C', ':Bufonly<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<M-1>', ':ToggleTerm size=80 direction=vertical<CR>', { noremap = true })  -- open
map('n', '<M-2>', ':ToggleTerm size=10 direction=horizontal<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
-- map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close

-- Comment
map('n', '<leader>/', ':CommentToggle<CR>')          -- Toggle comments
map('v', '<leader>/', ':CommentToggle<CR>')          -- Toggle comments
map('n','<Leader>ng', ':Neogit<CR>')
map('n', '<S-l>', ':BufferLineCycleNext<CR>')
map('n', '<S-h>', ':BufferLineCyclePrev<CR>')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tf', function() builtin.find_files({ cwd = vim.loop.cwd()}) end, {})
vim.keymap.set('n', '<leader>tg', function() builtin.live_grep({ cwd = vim.loop.cwd()}) end, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>th', ':Telescope harpoon marks<CR>')

-- local dap = require('dapui')
-- vim.keymap.set('n', '<leader>ba', dap.toggle, {})
-- vim.keymap.set('n', '<leader>bb', ":DapToggleBreakpoint<CR>", {})
-- vim.keymap.set('n', '<leader>bs', ":DapContinue<CR>", {})

-- Harpoon maps
local harpoon_mark = require('harpoon.mark')
local harpoon_ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>ha', harpoon_mark.add_file)
vim.keymap.set('n', '<leader>hh', harpoon_ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

vim.keymap.set('n', '<leader>T', function() require("trouble").toggle() end)
vim.keymap.set('n', '<leader>l', ':LspRestart<CR>')
vim.keymap.set('n', '<leader>k', function() require('notify').dismiss { pending = true, silent = true } end)

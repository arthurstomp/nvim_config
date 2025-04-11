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
map('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>')

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

-- Terminal mappings
map('n', '<M-1>', ':ToggleTerm size=80 direction=vertical<CR>', { noremap = true })   -- open
map('n', '<M-2>', ':ToggleTerm size=10 direction=horizontal<CR>', { noremap = true }) -- open
map('t', '<Esc>', '<C-\\><C-n>')                                                      -- exit

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>') -- open/close
-- map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh

-- Tagbar
-- map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close

-- Comment
map('n', '<leader>/', ':CommentToggle<CR>') -- Toggle comments
map('v', '<leader>/', ':CommentToggle<CR>') -- Toggle comments

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>T', ':Telescope<CR>')
vim.keymap.set('n', '<leader>td', function() builtin.diagnostics({ bufnr = 0 }) end, {})
vim.keymap.set('n', '<leader>tf', function() builtin.find_files({ cwd = vim.loop.cwd() }) end, {})
vim.keymap.set('n', '<leader>tg', function() builtin.live_grep({ cwd = vim.loop.cwd() }) end, {})
vim.keymap.set('n', '<leader>tr', function() builtin.lsp_references({ cwd = vim.loop.cwd() }) end, {})
vim.keymap.set('n', '<leader>ti', function() builtin.lsp_definitions({ cwd = vim.loop.cwd() }) end, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>tc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>tx', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>ts', builtin.git_status, {})
vim.keymap.set('n', '<leader>th', ':Telescope harpoon marks<CR>')


-- Harpoon maps
local harpoon_mark = require('harpoon.mark')
local harpoon_ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>ha', harpoon_mark.add_file)
vim.keymap.set('n', '<leader>hh', harpoon_ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

vim.keymap.set('n', '<leader>l', ':LspRestart<CR>')
vim.keymap.set('n', '<leader>k', function() require('notify').dismiss { pending = true, silent = true } end)

vim.keymap.set('n', '<leader>d', ':NvimTreeFindFile<CR>')

vim.keymap.set('n', '<leader>nw', ':Telescope neorg switch_workspace<CR>')
vim.keymap.set('n', '<leader>nh', ':Telescope neorg search_headings<CR>')
vim.keymap.set('n', '<leader>nf', ':Telescope neorg find_norg_files<CR>')
vim.keymap.set('n', '<leader>ni', ':Neorg index<CR>')
vim.keymap.set('n', '<leader>nr', ':Neorg return<CR>')
vim.keymap.set('n', '<leader>ns', '<Plug>(neorg.qol.todo-items.todo.task-cycle)')

vim.keymap.set('n', '<leader>at', ':GpChatToggle vsplit<CR>')
vim.keymap.set('n', '<leader>an', ':GpChatNew vsplit<CR>')
vim.keymap.set('n', '<leader>ad', ':GpChatDelete<CR>')
vim.keymap.set('n', '<leader>ar', ':GpChatRespond<CR>')
vim.keymap.set('n', '<leader>ai', ':GpImage<CR>')
vim.keymap.set('v', '<leader>ac', ':GpImplement<CR>')
vim.keymap.set('n', '<leader>as', ':GpStop<CR>')
vim.keymap.set('i', '<F8>', 'least words needed')

vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

local ls = require('luasnip')
vim.keymap.set({"i", "s"}, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {silent = true})

vim.keymap.set({"i", "s"}, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, {silent = true})

vim.keymap.set({"i", "s"}, "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

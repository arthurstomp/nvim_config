vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  group = augroup,
  buffer = bufnr,
  command = 'normal zR'
})

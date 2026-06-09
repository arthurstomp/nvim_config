local orgmode = {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
    })

    -- Experimental LSP support
    vim.lsp.enable('org')
  end,
}

local orgroam = {
  "chipsenkbeil/org-roam.nvim",
  tag = "0.2.0",
  dependencies = {
    {
      "nvim-orgmode/orgmode",
      tag = "0.7.0",
    },
  },
  config = function()
    require("org-roam").setup({
      directory = "~/orgfiles",
    })
  end
}
return {
  orgmode = orgmode,
  orgroam = orgroam
}

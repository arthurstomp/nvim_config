local remote_sshfs = {
  "nosduco/remote-sshfs.nvim",
  dependencies = { "folke/snacks.nvim", "nvim-lua/plenary.nvim" },
  opts = { ui = { picker = "snacks" } },
}

return {
  remote_sshfs = remote_sshfs
}

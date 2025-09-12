return {
  { import = "nvchad.blink.lazyspec" },
  {
    "saghen/blink.cmp",
    opts = { keymap = { ["<CR>"] = false } },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Disabled plugins
  { "nvim-tree/nvim-tree.lua", enabled = false },
}

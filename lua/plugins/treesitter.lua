-- You don't have to worry about ensure_installed because it auto installs the langauge of the opened file anyway.

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = true,
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      "html",
      "css",
      "cpp",
      "nu",
      "tsx",
    },
  },
}

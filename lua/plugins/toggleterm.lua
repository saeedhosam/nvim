return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  opts = {--[[ things you want to change go here]]
    open_mapping = { [[<M-/>]], [[<M-'>]] },
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  },
}

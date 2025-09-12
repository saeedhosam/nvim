-- When you add the formatter for a specific language, just run :MasonInstallAll

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    scss = { "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
    bash = { "shfmt" },
    sh = { "shfmt" },
    typescript = { "prettier" },
    javascript = { "prettier" },
    jsx = { "prettier" },
    tsx = { "prettier" },
    typescriptreact = { "prettier" },
    toml = { "taplo" },
    cpp = { "clang-format" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options

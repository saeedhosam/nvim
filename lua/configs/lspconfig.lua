-- When you add the lsp server for a specific language, just run :MasonInstallAll
require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "qmlls", "ts_ls", "eslint", "tailwindcss" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

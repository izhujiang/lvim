local formatters = require("lvim.lsp.null-ls.formatters")
local null_ls = require("null-ls")

formatters.setup({
  null_ls.builtins.formatting.beautysh, -- sh
  null_ls.builtins.formatting.shfmt,
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  --TODO:dotenv_linter not working
  -- null_ls.builtins.diagnostics.dotenv_linter, -- NOT working, why?
  { name = "dotenv_linter" },
})
local formatters = require("lvim.lsp.null-ls.formatters")
local null_ls = require("null-ls")

formatters.setup({
  null_ls.builtins.formatting.sqlfmt,
  null_ls.builtins.formatting.pg_format, -- sql, pgsql
})
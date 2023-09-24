local linters = require("lvim.lsp.null-ls.linters")
local null_ls = require("null-ls")

linters.setup({
  null_ls.builtins.diagnostics.vint,
})
local null_ls = require("null-ls")

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  null_ls.builtins.diagnostics.commitlint,
})
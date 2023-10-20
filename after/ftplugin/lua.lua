local formatters = require("lvim.lsp.null-ls.formatters")
local null_ls = require("null-ls")

formatters.setup({
  null_ls.builtins.formatting.stylua,
})

if vim.loop.os_uname().machine ~= "aarch64" then
  local linters = require("lvim.lsp.null-ls.linters")
  linters.setup({
    null_ls.builtins.diagnostics.selene,
  })
end
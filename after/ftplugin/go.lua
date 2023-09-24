local formatters = require("lvim.lsp.null-ls.formatters")
local null_ls = require("null-ls")

formatters.setup({
  -- { command = "gofumpt", filetypes = { "go" } },
  -- { command = "goimports", filetypes = { "go" } },

  null_ls.builtins.formatting.gofumpt,
  null_ls.builtins.formatting.goimports,
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  -- { command = "golangci_lint", filetypes = { "go" } },

  null_ls.builtins.diagnostics.golangci_lint,
})

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
  -- { command = "gomodifytags", filetypes = { "go" } },
  -- { command = "impl", filetypes = { "go" } },

  null_ls.builtins.code_actions.gomodifytags, -- golang
  null_ls.builtins.code_actions.impl, -- golang
})
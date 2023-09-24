local formatters = require("lvim.lsp.null-ls.formatters")
local null_ls = require("null-ls")

formatters.setup({
  -- { command = "black", filetypes = { "python" } },
  -- { command = "ruff",  filetypes = { "python" } },
  -- { command = "isort", filetypes = { "python" } },

  null_ls.builtins.formatting.black, -- python
  null_ls.builtins.formatting.ruff, -- python
  -- null_ls.builtins.formatting.flake8,   -- python
  null_ls.builtins.formatting.isort, -- python
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  -- { command = "ruff", filetypes = { "python" } },

  null_ls.builtins.diagnostics.ruff,
  -- { command = "flake8", filetypes = { "python" } },
})
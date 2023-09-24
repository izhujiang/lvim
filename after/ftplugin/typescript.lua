local formatters = require("lvim.lsp.null-ls.formatters")
local null_ls = require("null-ls")

formatters.setup({
  null_ls.builtins.formatting.rome,
  null_ls.builtins.formatting.deno_fmt.with({
    condition = function(utils)
      return utils.root_has_file({ "deno.json", "deno.jsonc" })
    end,
  }),
})
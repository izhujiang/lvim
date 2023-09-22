-- local is_deno =
-- if is_deno() then
require("lvim.lsp.manager").setup("denols", {
  root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
  settings = {
    {
      deno = {
        enable = true,
        suggest = {
          imports = {
            hosts = {
              ["https://crux.land"] = true,
              ["https://deno.land"] = true,
              ["https://x.nest.land"] = true,
            },
          },
        },
      },
    },
  },
})
-- else
require("lvim.lsp.manager").setup("tsserver", {
  root_dir = require("lspconfig").util.root_pattern("package.json"),
  single_file_support = false,

  settings = {
    typescript = {
      format = {
        indentSize = vim.o.shiftwidth,
        convertTabsToSpaces = vim.o.expandtab,
        tabSize = vim.o.tabstop,
      },
    },
    javascript = {
      format = {
        indentSize = vim.o.shiftwidth,
        convertTabsToSpaces = vim.o.expandtab,
        tabSize = vim.o.tabstop,
      },
    },
    completions = {
      completeFunctionCalls = true,
    },
  },

  keys = {
    { "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", desc = "Organize Imports" },
    { "<leader>cR", "<cmd>TypescriptRenameFile<CR>", desc = "Rename File" },
  },
})
-- end

-- local Util = require("util")
-- if Util.lsp_get_config("denols") and Util.lsp_get_config("tsserver") then
--   local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
--   Util.lsp_disable("tsserver", is_deno)
--   Util.lsp_disable("denols", function(root_dir)
--     return not is_deno(root_dir)
--   end)
-- end
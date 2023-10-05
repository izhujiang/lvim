local util = require("lspconfig.util")
local typescript = require("mason-lspconfig.typescript")

-- walk around mason-lspconfig's default config which fails when typescript sdk is not available in ${project}/node_modules/
require("lvim.lsp.manager").setup("astro", {
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  init_options = {
    typescript = {},
  },
  on_new_config = function(new_config, new_root_dir)
    if vim.tbl_get(new_config.init_options, "typescript") and not new_config.init_options.typescript.tsdk then
      local workspace_dir = new_root_dir
      local install_dir = require("mason-registry").get_package("astro-language-server"):get_install_path()
      -- using typescript sdk in ${mason}/packages/astro-language-server/node_modules/ in case that sdk does not exist in ${project}/node_modules/
      new_config.init_options.typescript.serverPath = typescript.resolve_tsserver(install_dir, workspace_dir)
      new_config.init_options.typescript.tsdk = typescript.resolve_tsdk(install_dir, workspace_dir)
    end
    print(vim.inspect(new_config.init_options.typescript))
  end,
})
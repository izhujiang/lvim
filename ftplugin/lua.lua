-- $LUNARVIM_CONFIG_DIR/ftplugin/lua.lua
local opts = {
  settings = {
    Lua = { hint = { enable = false } },
  },
}
require("lvim.lsp.manager").setup("sumneko_lua", opts)

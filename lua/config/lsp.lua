-- 5. Language features
-- check information
-- :LvimInfo  -- Contains information about all the servers attached to the buffer you are editing and their current capabilities,
-- :LspInfo   -- Contains basic information about all the servers that are running.
-- :Mason     -- Contains information about all the servers that you can manage with mason
--:LvimCacheReset

-- 5.1 Language servers
-- LunarVim uses filetype plugins to enable lazy-loading the setup of a language server.
-- lvim.lsp.automatic_configuration.skipped_servers contains a list of servers that will not be automatically configured by default.
-- Any changes to lvim.lsp.automatic_configuration.skipped_servers must be followed by :LvimCacheReset to take effect.

-- Installing and updating a server
-- LunarVim uses filetype plugins to enable lazy-loading the setup of a language server. A template generator is used to create ftplugin files and populate them with the setup call.
-- lvim.lsp.automatic_servers_installation = false
-- :LspInstall `<your_language_server>` Or use :Mason and interactively choose which servers to install and update
--
-- Changing the default server
-- To use a different server than the default one add the default server to the skipped_servers list and remove the one you want to use.
-- Sample: Use jedi_language_server instead of pyright, add "pyright" to and remove `jedi_language_server` from `skipped_servers` list
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "jedi_language_server"
-- end, lvim.lsp.automatic_configuration.skipped_servers)
--
-- Overriding settings
-- 1) :LspSettings <TAB>
-- Refer to the documentation of nlsp-settings for a full updated list of supported language servers.
--
-- 2) By overriding the setup (*)
-- Add the server you wish to configure manually to lvim.lsp.automatic_configuration.skipped_servers.
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "sumneko_lua" })
-- setup server using the builtin lsp manager in $LUNARVIM_CONFIG_DIR/ftplugin/<filetype>.lua

-- 5.2 Linting and formatting
-- Setting a formatter will override the language server formatting capabilities.
-- The easiest way is to reference the linter/formatter/code_actions by their names. See the null-ls docs (https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md) for a full list of builtins with their names.

-- Installing linters/formatters
-- use :Mason to install most of the supported linters and formatters
-- Or install lsp server on demand
lvim.lsp.installer.setup = {
  ensure_installed = {
    -- "bashls",
    -- "clangd",
    -- "cssls",
    -- "denols",
    -- "dockerls",
    -- "docker_compose_language_service",
    -- "gopls",
    -- "html",
    -- "jsonls",
    -- "lua_ls",
    -- "marksman",
    -- "pyright",
    -- "ruff_lsp",
    -- "solargraph",
    -- "taplo",
    -- "tsserver", -- confix with denols
    -- "vimls",
    -- "yamlls",
  },
  automatic_installation = {
    exclude = { "astro" },
  },
}

-- Add the servers to configure manually,
-- set it up using the builtin lsp manager in $LUNARVIM_CONFIG_DIR/ftplugin/<filetype>.lua
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver", "astro" })

-- enable the servers to configure automatically
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "denols"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

local null_ls = require("null-ls")

-- formatters.setup({
--   -- null_ls.builtins.formatting.stylua,
-- })

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  null_ls.builtins.diagnostics.codespell,
})

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
  null_ls.builtins.code_actions.gitsigns,
  null_ls.builtins.code_actions.refactoring,
})

-- Lazy-loading the linter/formatter/code_actions setup
-- By default, all null-ls providers are checked on startup.
-- set up the provider when opening the associated file-type
-- config provider in $LUNARVIM_CONFIG_DIR/after/ftplugin/

-- Formatting on save
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.lua", "*.py", "*.go", "*.js", "*.ts", "*.c", "*.cpp", "*.h", "*.html", "*.css" }

-- better lsp
-- -------------------------------------------------------------------------------------------
-- use builtin keybindings
-- lvim.lsp.buffer_mappings.normal_mode["K"] = { vim.lsp.buf.hover, "Show hover" }
-- lvim.lsp.buffer_mappings.normal_mode["gd"] = { vim.lsp.buf.definition, "Goto definition" }
-- lvim.lsp.buffer_mappings.normal_mode["gD"] = { vim.lsp.buf.declaration, "Goto Declaration" }
-- lvim.lsp.buffer_mappings.normal_mode["gr"] = { vim.lsp.buf.references, "Goto references" }
-- lvim.lsp.buffer_mappings.normal_mode["gI"] = { vim.lsp.buf.implementation, "Goto Implementation" }
-- lvim.lsp.buffer_mappings.normal_mode["gs"] = { vim.lsp.buf.signature_help, "Show signature_help" }
-- lvim.lsp.buffer_mappings.normal_mode["gl"] = { vim.diagnostic.open_float, "Show line diagnostics" }

lvim.lsp.buffer_mappings.normal_mode["K"] = { vim.lsp.buf.hover, "Show Documentation" }
lvim.lsp.buffer_mappings.normal_mode["[d"] = { vim.diagnostic.goto_prev, "Previous Diagnostic" }
lvim.lsp.buffer_mappings.normal_mode["]d"] = { vim.diagnostic.goto_next, "Next Diagnostic" }

lvim.builtin.which_key.mappings["d"] = vim.tbl_extend("keep", lvim.builtin.which_key.mappings["d"], {
  f = {
    function()
      local float = vim.diagnostic.config().float
      if float then
        local config = type(float) == "table" and float or {}
        config.scope = "line"
        vim.diagnostic.open_float(config)
      end
    end,
    "Open_float",
  },
  q = { vim.diagnostic.setqflist, "Quickfix" },
  l = { vim.diagnostic.setloclist, "Loclist" },
})

lvim.builtin.which_key.mappings["l"] = vim.tbl_extend("keep", lvim.builtin.which_key.mappings["l"], {
  h = { vim.lsp.buf.signature_help, "Signature help" },

  f = { vim.lsp.format, "Format" },
  r = { vim.lsp.buf.rename, "Rename" },
  a = { vim.lsp.buf.code_action, "Code Action" },
  l = { vim.lsp.codelens.run, "CodeLens Action" },

  j = { vim.diagnostic.goto_next, "Next Diagnostic" },
  k = { vim.diagnostic.goto_prev, "Prev Diagnostic" },
  q = { vim.diagnostic.setloclist, "Quickfix" },

  i = { -- highlights under cursor, Show all the items at a given buffer position.
    vim.show_pos,
    "Inspect",
  },
})

-- 5.3 Custom snippets  (TODO: add some snippets)
-- lua version
-- ~/.config/lvim/luasnippets/
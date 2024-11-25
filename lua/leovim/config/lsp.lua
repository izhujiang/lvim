-- 5. Language features
-- check information
-- :LvimInfo  -- Contains information about all the servers attached to the buffer you are editing and their current capabilities,
-- :LspInfo   -- Contains basic information about all the servers that are running.
-- :Mason     -- Contains information about all the servers that you can manage with mason
-- :LvimCacheReset

-- 5.1 Language servers

-- 1) Installing and updating a server
-- LunarVim uses filetype plugins to enable lazy-loading the setup of a language server.
-- lvim.lsp.automatic_servers_installation = false
-- :LspInstall `<your_language_server>` Or use :Mason and interactively choose which servers to install and update
lvim.lsp.installer.setup = {
  ensure_installed = {
    -- "bashls",
    -- "clangd",
    -- "cssls",
    -- "denols",
    "gopls",
    -- "html",
    -- "jsonls",
    "lua_ls",
    "pyright",
    -- "ruff_lsp",
    -- "taplo",
    -- "tsserver", -- confix with denols
  },
  -- automatic_installation = true,
  automatic_installation = {
    exclude = { "astro" },
  },
}

-- 2) Changing the default server
-- To use a different server than the default one add the default server to the skipped_servers list and remove the one you want to use.
-- Sample: Use jedi_language_server instead of pyright, add "pyright" to and remove `jedi_language_server` from `skipped_servers` list

-- disabled pyright automatic_configuration
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- enabled jedi_language_server automatic configuration
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "jedi_language_server"
-- end, lvim.lsp.automatic_configuration.skipped_servers)
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "ruff", "tsserver", "astro" })
-- skipped_filetypes = { "markdown", "rst", "plaintext", "toml", "proto" },

-- Important: any changes to lvim.lsp.automatic_configuration.skipped_servers must be followed by :LvimCacheReset to take effect.

-- 3) Overriding settings
-- -- :LspSettings <TAB>
-- Refer to the documentation of nlsp-settings for a full updated list of supported language servers.
-- $LUNARVIM_CONFIG_DIR/lsp-settings/<lsp_server>.lua

-- -- By overriding the setup (*)
-- Add the server you wish to configure manually to lvim.lsp.automatic_configuration.skipped_servers.
-- setup server using the builtin lsp manager in $LUNARVIM_CONFIG_DIR/ftplugin/<filetype>.lua

-- 5.2 Linting and formatting
-- Important: setting a formatter will override the language server formatting capabilities.

-- 1) Installing linters/formatters
-- use :Mason to install most of the supported linters and formatters

-- 2) Lazy-loading the linter/formatter/code_actions
-- By default, all null-ls providers are checked on startup.
-- Or set up the providers when opening the associated file-type config provider in $LUNARVIM_CONFIG_DIR/after/ftplugin/
-- Or the provideers can also be setup with "FileType" autocmd handlers.

lvim.lsp.null_ls.server_setup = {
  {
    pattern = { "*" },
    linters = {
      sources = {
        { name = "codespell" },
      },
    },
    code_actions = {
      sources = {
        { name = "gitsigns" },
        { name = "refactoring" },
      },
    },
  },
  {
    pattern = { "cmake" },
    formatters = {
      sources = {
        { name = "cmake_format" },
      },
    },
    linters = {
      sources = {
        { name = "cmake_lint" },
      },
    },
  },
  {
    pattern = { "go" },
    formatters = {
      sources = {
        { name = "gofumpt" },
        { name = "goimports" },
      },
    },
    linters = {
      -- { name = "golangci_lint", method = "NULL_LS_DIAGNOSTICS" },
      { name = "golangci_lint" },
    },
    code_actions = {
      sources = {
        { name = "gomodifytags" },
        { name = "impl" },
      },
    },
  },
  {
    pattern = { "gitcommit" },
    linters = {
      sources = {
        { name = "commitlint" },
      },
    },
  },
  {
    pattern = { "java" },
    formatters = {
      sources = {
        { name = "google_java_format" },
      },
    },
  },
  {
    pattern = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "less",
      "html",
      "json",
      "jsonc",
      "yaml",
      "markdown",
      "markdown.mdx",
      "graphql",
      "handlebars",
      "svelte",
      "astro",
      "htmlangular",
    },
    formatters = {
      sources = {
        { name = "prettier" },
      },
    },
  },
  {
    pattern = { "lua", "luau" },
    formatters = {
      sources = {
        { name = "stylua" },
      },
    },
    linters = {
      sources = {
        { name = "selene" },
      },
    },
  },
  {
    pattern = { "make" },
    linters = {
      sources = {
        { name = "checkmake" },
      },
    },
  },
  {
    pattern = { "markdown" },
    formatters = {
      sources = {
        { name = "markdownlint" },
      },
    },
    linters = {
      sources = {
        { name = "markdownlint" },
      },
    },
  },
  {
    pattern = { "python" },
    formatters = {
      sources = {
        -- Ruff, fast formatter and linter, can be used to replace Flake8 (plus
        -- dozens of plugins, black, isort, pydocstyle, pyupgrade, autoflake,
        -- use ruff as lsp server replace pyright directly or as tool-chain of CI/CD
        { name = "black" },
      },
    },
    linters = {
      sources = {
        { name = "pylint" },
      },
    },
  },
  {
    pattern = { "sh" },
    formatters = {
      sources = {
        { name = "shfmt" },
      },
    },
    linters = {
      sources = {
        { name = "dotenv_linter" },
      },
    },
  },
  {
    pattern = { "sql", "jinja", "pgsql" },
    formatters = {
      sources = {
        { name = "sqlfmt" },
        { name = "pg_format" },
      },
    },
  },
  {
    pattern = { "vim" },
    linters = {
      sources = {
        { name = "vint" },
      },
    },
  },
  {
    pattern = { "yaml" },
    linters = {
      sources = {
        { name = "actionlint" },
      },
    },
  },
}

-- Formatting on save
lvim.format_on_save.enabled = true
-- lvim.format_on_save.pattern = { "*.lua", "*.py", "*.go", "*.js", "*.ts", "*.c", "*.cpp", "*.h", "*.html", "*.css" }

-- 5.3 Custom snippets  (TODO: add some snippets)
-- lua version
-- ~/.config/lvim/luasnippets/
return {
  {
    "jay-babu/mason-null-ls.nvim",
    -- enabled = false,
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "commitlint",
        "gofumpt",
        "goimports",
        "golangci-lint",
        "gomodifytags",
        "impl",
        "jq",
        "markdownlint",
        "misspell",
        "ruff",
        "shfmt",
        "stylua",
        "selene",
      },

      automatic_installation = { exclude = { "rust_analyzer", "solargraph" } },
    },
    -- config = function()
    --   require("mason-null-ls").setup({
    --     automatic_installation = false, -- disable automatic, due to mason-null-ls missing tools like makecheck in null-ls list
    --     ensure_installed = ensure_installed,
    --   })
    -- end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    event = "VeryLazy",
    opts = {
      -- {'python', 'cppdbg', 'delve', 'node2', 'chrome', 'firefox', 'php', 'coreclr', 'js', 'codelldb', 'bash', 'javadbg', 'javatest', 'mock', 'puppet', 'elixir', 'kotlin', 'dart', 'haskell'}
      ensure_installed = {
        "python",
        "delve",
        "codelldb",
        "js",
      },
      automatic_installation = true,
      -- handlers = {}, -- sets up dap in the predefined manner. Provides a dynamic way of setting up sources and any other logic needed;
    },
  },
}
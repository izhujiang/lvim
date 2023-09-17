lvim.builtin.treesitter = vim.tbl_deep_extend("force", lvim.builtin.treesitter, {
  -- TODO:: A list of parser names, or "all"
  -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "comment",
    "cpp",
    "css",
    "diff",
    "dockerfile",
    "dot",
    "gitcommit",
    "go",
    "html",
    "java",
    "javascript",
    "json",
    "json5",
    "jsonc",
    "lua",
    "markdown",
    "markdown_inline",
    "ninja",
    "prisma",
    "python",
    "ruby",
    "ron",
    "rust",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
  },

  sync_install = false,
  auto_install = true,
  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  -- Available modules: Highlight, Increment Selection, Indentation, Folding
  modules = {},
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    -- disable = { "c", "rust" },
  },
  indent = {
    enable = true,
    disable = { "python", "css", "yaml" },
  },
  incremental_selection = {
    enable = false,
    -- keymaps = {
    -- init_selection = "<C-space>",
    -- node_incremental = "<C-space>",
    -- scope_incremental = false,
    -- node_decremental = "<bs>",
    -- },
  },
  autopairs = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    -- TODO: add languages support
    config = {
      css = "/* %s */",
      html = "<!-- %s -->",
      json = "",
      scss = "/* %s */",
      svelte = "<!-- %s -->",
      typescript = "// %s",
      vue = "<!-- %s -->",
      go = "// %s",
      c = "// %s",
      cpp = "// %s",
      java = "// %s",
      lua = "-- %s",
      python = "# %s",
      sh = "# %s",
      ruby = "# %s",
      rust = "// %s",
      vim = '" %s',
    },
  },
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true

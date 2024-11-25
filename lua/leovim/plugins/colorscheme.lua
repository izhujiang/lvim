return {
  -- the colorscheme should be available when starting Neovim
  -- tokyonight, A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins.
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   opts = { style = "moon" },
  --   config = true,
  -- },

  {
    -- Everforest is a green based color scheme; it's designed to be warm and soft in order to protect developers' eyes.
    "sainnhe/everforest",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins

    dependencies = {
      { "nvim-lualine/lualine.nvim" },
    },

    init = function()
      vim.g.everforest_background = "soft"
      vim.g.everforest_better_performance = 1
    end,
  },

  -- catppuccin, Soothing pastel theme for (Neo)vim
  -- usage:
  -- :colorscheme catppuccin " or catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
  -- TODO: config for integrations with other plugins
  -- PERF
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      integrations = {
        alpha = true,
        cmp = true,
        dap = {
          enabled = true,
          enable_ui = true, -- enable nvim-dap-ui
        },
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = false,
        lsp_trouble = true,
        markdown = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
          inlay_hints = {
            background = true,
          },
        },
        navic = { enabled = true },
        neotest = true,
        nvimtree = true,
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = {
          enabled = true,
          -- style = "nvchad"
        },
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
}
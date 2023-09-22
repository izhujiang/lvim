return {
  -- Better `vim.notify()`
  -- A fancy, configurable, notification manager for NeoVim
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>fn",
        "<cmd>Telescope notify<cr>",
        desc = "Notifications",
      },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    init = function()
      local Util = require("util")
      Util.on_very_lazy(function()
        vim.notify = require("notify") -- setting it as default notify function, so other plugins can use the notification windows by calling vim.notify(msg)
      end)
    end,
  },

  -- better vim.ui
  -- Neovim plugin to improve the default vim.ui interfaces (select, input)
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
    opts = {
      input = {
        -- Set to `false` to disable
        mappings = {
          n = {
            ["<Esc>"] = "Close",
            ["<CR>"] = "Confirm",
          },
          i = {
            ["<C-c>"] = "Close",
            ["<CR>"] = "Confirm",
            ["<C-n>"] = "HistoryNext",
            ["<C-p>"] = "HistoryPrev",
            ["<C-j>"] = "HistoryNext",
            ["<C-k>"] = "HistoryPrev",
            ["<Up>"] = "false",
            ["<Down>"] = "false",
          },
        },
        win_options = {
          -- Window transparency (0-100)
          winblend = 0,
          -- Disable line wrapping
          wrap = false,
          -- Indicator for when text exceeds window
          list = true,
          listchars = "precedes:…,extends:…",
          -- Increase this for more context when text scrolls off the window
          sidescrolloff = 0,
        },
      },
    },
  },
}
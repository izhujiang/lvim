return {
  -- The interactive scratchpad for hackers.
  -- usage:
  -- :Codi [filetype]       -- activates Codi for the current buffer
  -- :Codi!                 -- deactivates Codi for the current buffer.
  -- :Codi!! [filetype]     -- toggles Codi for the current buffer
  -- :CodiNew [filetype]    -- creates a new scratch buffer with Codi in it.
  -- :CodiSelect            -- opens a select menu and creates a new scratch buffer
  -- :CodiExpand            -- expands the output of the current line in a popup menu to display multi-line content.
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },

  {
    -- autoclose and autorename html tag
    "windwp/nvim-ts-autotag",
    ft = { "html", "xml", "jsx", "tsx" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  { -- live edit html, css, and javascript in vim
    "turbio/bracey.vim",
    build = "npm install --prefix server",
    ft = { "html" },
    cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
  },

  { -- A markdown preview
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    ft = { "markdown" },
    config = true,
  },
}
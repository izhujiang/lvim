return {
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
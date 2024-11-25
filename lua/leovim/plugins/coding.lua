return {
  -- function signatures source for nvim-cmp
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    event = { "InsertEnter" },
    config = function()
      local cmp = require("cmp")
      table.insert(cmp.get_config().sources, { name = "nvim_lsp_signature_help", group_index = 3 })
    end,
  },

  -- Git source for nvim-cmp
  {
    "petertriho/cmp-git",
    event = { "InsertEnter" },
    config = function()
      local cmp = require("cmp")
      table.insert(cmp.get_config().sources, { name = "git", group_index = 4 })

      require("cmp_git").setup()
    end,
  },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    event = { "InsertEnter" },
    config = function()
      local cmp = require("cmp")
      table.insert(cmp.get_config().sources, { name = "codeium", group_index = 1, priority = 700 })

      require("codeium").setup({})
    end,
  },

  -- copilot-cmp transforms copilot.lua into a cmp source.
  {
    "zbirenbaum/copilot-cmp",
    enabled = false,
    dependencies = { "zbirenbaum/copilot.lua" },
    event = "InsertEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)

      local cmp = require("cmp")
      table.insert(cmp.get_config().sources, { name = "copilot_cmp", group_index = 1 })
    end,
  },

  -- AI pair programmer
  -- Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot
  -- TODO: config "zbirenbaum/copilot.lua", "zbirenbaum/copilot-cmp", and "nvim-lualine/lualine.nvim" at same time
  -- Ref https://www.lazyvim.org/extras/coding/copilot#copilot-cmp
  --
  -- :Copilot auth
  -- once the plugin is installed to start the authentication process.
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    cmd = { "Copilot" },
    build = ":Copilot auth",
    -- disable copilot.lua's suggestion and panel modules, as they can
    -- interfere with completions properly appearing in copilot-cmp.
    -- https: //github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
    -- https://github.com/zbirenbaum/copilot-cmp?tab=readme-ov-file#lazy
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      -- filetypes = {
      --   markdown = true,
      --   help = true,
      -- },
    },
  },

  -- Nvim-Surround (Manipulating Surroundings)
  -- 	usage:
  -- 	  y[sS]{motion}{char} or yss[SS]{char}, char: " ' { [ ( t }  Examples: ys$"
  -- 	  cs{s1}{s2}
  -- 	  ds{s1}
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = { "BufReadPost", "BufNewFile" },
    -- opts = {
    --   keymaps = {
    --   insert = "<C-g>s",
    --   insert_line = "<C-g>s",
    --   normal = "ys",
    --   normal_cur = "yss",
    --   normal_line = "yS",
    --   normal_cur_line = "ySS",
    --   visual = "S",
    --   visual_line = "gS",
    --   delete = "ds",
    --   change = "cs",
    --   },
    -- },
    config = true,
  },
}
return {
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    event = "InsertEnter",
  },

  { -- TabNine plugin for hrsh7th/nvim-cmp
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    event = "InsertEnter",
  },

  { -- Tabnine client for Neovim
    "codota/tabnine-nvim",
    -- TODO: try to fix config issue later
    enabled = false,
    dependencies = {
      { "nvim-lualine/lualine.nvim" },
    },
    build = "./dl_binaries.sh",
    event = "InsertEnter",

    -- TODO: solve confix with nvim-cmp
    -- nvim-cmp maps <Tab> to navigating through pop menu items (see here) This conflicts with Tabnine <Tab> for inline completion. To get this sorted you can either:
    -- Bind Tabnine inline completion to a different key using accept_keymap
    -- Bind cmp.select_next_item() & cmp.select_prev_item() to different keys, e.g: <C-k> & <C-j>

    config = function()
      require("tabnine").setup({
        disable_auto_comment = false,
        accept_keymap = "<C-y>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt" },
        log_file_path = nil, -- absolute path to Tabnine log file
      })
    end,
  },

  {
    -- AI pair programmer
    -- Make sure to run :Lazy load copilot-cmp followed by
    -- :Copilot auth
    -- once the plugin is installed to start the authentication process.
    "zbirenbaum/copilot-cmp",
    -- TODO: enable copilot_cmp and setup source for cmp
    -- TODO: config "zbirenbaum/copilot.lua", "zbirenbaum/copilot-cmp", and "nvim-lualine/lualine.nvim" at same time
    -- Ref https://www.lazyvim.org/extras/coding/copilot#copilot-cmp
    enabled = false,
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup({
          -- disable copilot.lua's suggestion and panel modules, as they can interfere with completions properly appearing in copilot-cmp.
          suggestion = { enabled = false },
          panel = { enabled = false },
        })                             -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  },

  -- TODO: config "zbirenbaum/copilot.lua", "zbirenbaum/copilot-cmp", and "nvim-lualine/lualine.nvim" at same time
  -- Ref https://www.lazyvim.org/extras/coding/copilot#copilot-cmp
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },

  -- Nvim-Surround (Manipulating Surroundings)
  -- 	ys{iw/motion}" ' { [ ( t }  Examples: ys$"
  -- 	cs{s1}{s2}
  -- 	ds{s1}
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
        -- keymaps = {
        --   insert = "<C-g>o",
        --   insert_line = "<C-g>O",
        --   normal = "yo",
        --   normal_cur = "yoo",
        --   normal_line = "yO",
        --   normal_cur_line = "yOO",
        --   visual = "O",
        --   visual_line = "gO",
        --   delete = "do",
        --   change = "co",
        -- },
      })
    end,
  },
}

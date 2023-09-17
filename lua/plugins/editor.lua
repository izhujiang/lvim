return {
  -- file explorer, Neovim plugin to manage the file system and other tree like structures. replace nvim-tree
  --usage
  --:Neotree filesystem reveal right
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      {
        "<leader>ee",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = require("util").get_root() })
        end,
        desc = "Files(root)",
      },
      {
        "<leader>ec",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Files(cwd)",
      },
      {
        "<leader>eb",
        function()
          require("neo-tree.command").execute({ source = "buffers", toggle = true })
        end,
        desc = "Buffers",
      },
      {
        "<leader>eg",
        function()
          -- require("neo-tree.command").execute({ position = "float", source = "git_status", toggle = true})
          require("neo-tree.command").execute({ position = "left", source = "git_status", toggle = true })
        end,
        desc = "Git_status",
      },
      {
        -- R for Reference
        "<leader>es",
        function()
          require("neo-tree.command").execute({ position = "left", source = "document_symbols", toggle = true })
        end,
        desc = "Symbols(document))",
      },
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,

    opts = {
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      -- add_blank_line_at_top = true,
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },

      default_component_configs = {
        container = {
          enable_character_fade = true,
        },
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰜌",

          -- The next two settings are only a fallback,
          -- TODO: find out other icon more meaningful
          default = " ", -- for unknown filetype
          highlight = "NeoTreeFileIcon",
        },
        modified = {
          symbol = "[+]",
          highlight = "NeoTreeModified",
        },
        -- name = {
        -- 	trailing_slash = false,
        -- 	use_git_status_colors = true,
        -- 	highlight = "NeoTreeFileName",
        -- },
        buffers = {
          follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time the current file is changed while the tree is open.
          },
          group_empty_dirs = false,
          show_unloaded = true,
          window = {
            mappings = {
              ["bd"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
            },
          },
        },
        git_status = {
          symbols = {
            -- Change type
            added = "+", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "x", -- this can only be used in the git_status source
            renamed = "󰁕", -- this can only be used in the git_status source
            -- Status type
            untracked = "?",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      }, -- end of default_component_configs

      filesystem = {
        bind_to_cwd = false,
        follow_current_file = {
          enabled = false, -- find and focus the file in the active buffer every time the current file is changed while the tree is open.
        },
        use_libuv_file_watcher = true, -- use_the_OS_level_file_watchers_to_detect_changes
        group_empty_dirs = false,

        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
        -- TODO: filter hidden items
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_hidden = true, -- only works on Windows for hidden files/directories
          hide_by_name = {
            "node_modules",
          },
          hide_by_pattern = { -- uses glob style patterns
            --"*.meta",
            --"*/src/*/tsconfig.json",
          },
          always_show = { -- remains visible even if other settings would normally hide it
            ".gitignored",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
            "thumbs.db",
            ".git",
          },
          never_show_by_pattern = { -- uses glob style patterns
            --".null-ls_*",
          },
        },
        window = {
          mappings = {
            ["."] = "set_root",
            ["H"] = "toggle_hidden",
            ["/"] = "fuzzy_finder",
            ["D"] = "fuzzy_finder_directory",
            ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
            -- ["D"] = "fuzzy_sorter_directory",
            ["f"] = "filter_on_submit",
            ["<c-x>"] = "clear_filter",
            ["[g"] = "prev_git_modified",
            ["]g"] = "next_git_modified",
          },
          fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
            ["<C-j>"] = "move_cursor_down",
            ["<C-k>"] = "move_cursor_up",
          },
        },
      }, -- end of filesystem

      buffers = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every
        },
        show_unloaded = true,
        window = {
          mappings = {
            ["bd"] = "buffer_delete",
            ["<bs>"] = "navigate_up",
            ["."] = "set_root",
          },
        },
      }, -- end of buffers
      git_status = {
        window = {
          position = "float",
          mappings = {
            ["A"] = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
          },
        },
      },
      document_symbols = {
        kinds = {
          File = { icon = "󰈙", hl = "Tag" },
          Namespace = { icon = "󰌗", hl = "Include" },
          Package = { icon = "󰏖", hl = "Label" },
          Class = { icon = "󰌗", hl = "Include" },
          Property = { icon = "󰆧", hl = "@property" },
          Enum = { icon = "󰒻", hl = "@number" },
          Function = { icon = "󰊕", hl = "Function" },
          String = { icon = "󰀬", hl = "String" },
          Number = { icon = "󰎠", hl = "Number" },
          Array = { icon = "󰅪", hl = "Type" },
          Object = { icon = "󰅩", hl = "Type" },
          Key = { icon = "󰌋", hl = "" },
          Struct = { icon = "󰌗", hl = "Type" },
          Operator = { icon = "󰆕", hl = "Operator" },
          TypeParameter = { icon = "󰊄", hl = "Type" },
          StaticMethod = { icon = "󰠄 ", hl = "Function" },
        },
      },
      source_selector = {
        winbar = true,
        statusline = false,
        sources = {
          { source = "filesystem", display_name = " 󰉓 Files " },
          -- { source = "buffers", display_name = "󰌗 Buffers" },
          { source = "document_symbols", display_name = " 󰀬 Symbols " },
          { source = "git_status", display_name = " 󰊢 Git " },
        },
      },
    },

    config = function(_, opts)
      require("neo-tree").setup(opts)
      vim.api.nvim_create_autocmd("TermClose", {
        pattern = "*lazygit",
        callback = function()
          if package.loaded["neo-tree.sources.git_status"] then
            require("neo-tree.sources.git_status").refresh()
          end
        end,
      })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    -- !Important: Load telescope after vim's startup,
    event = "VeryLazy",
    optional = true,
  },

  -- Navigate your code with search labels, enhanced character motions and Treesitter integration
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {
      modes = {
        search = {
          enabled = false, -- disable: integrate flash.nvim with your regular search using / or ?
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      -- {
      --   "r",
      --   mode = "o",
      --   function()
      --     require("flash").remote()
      --   end,
      --   desc = "Remote Flash",
      -- },
      -- {
      --   "R",
      --   mode = { "o", "x" },
      --   function()
      --     require("flash").treesitter_search()
      --   end,
      --   desc = "Treesitter Search",
      -- },
      -- {
      --   "<c-s>",
      --   mode = { "c" },
      --   function()
      --     require("flash").toggle()
      --   end,
      --   desc = "Toggle Flash Search",
      -- },
    },
  },

  --	A search and research tool, PANEL for neovim.
  -- search/replace in multiple files
  -- buf filetype: spectre
  -- Use command: :Spectre or <leader>S, <leader>ss, <leader>sw
  -- local commands:
  -- dd, <cr>, <leader>Q, <leader>l, <leader>R, <leader>rc, <leader>c, <leader>uu/uv/ui/uo/uh
  -- Warnings: Always commit your files before you replace text. nvim-spectre does not support undo directly.
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    cmd = "Spectre",
    keys = {
      {
        "<leader>as",
        function()
          require("spectre").toggle()
        end,
        "n",
        desc = "Spectre(Replace)",
      },
      {
        "<leader>rw",
        function()
          require("spectre").open_visual({ select_word = true })
        end,
        "n",
        desc = "Replace current word",
      },
      {
        "<leader>rw",
        "<esc><cmd>lua require('spectre').open_visual()<CR>",
        "v",
        desc = "Replace current word",
      },
      {
        "<leader>rW",
        function()
          require("spectre").open_file_search({ select_word = true })
        end,
        "n",
        desc = "Replace in current file",
      },
    },
    opts = {
      open_cmd = "noswapfile vnew",
      live_update = true,
      is_insert_mode = true,
      mapping = {
        ["send_to_qf"] = {
          map = "<leader>Q",
          cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
          desc = "send all items to quickfix",
        },
        ["show_option_menu"] = {
          map = "uo",
          cmd = "<cmd>lua require('spectre').show_options()<CR>",
          desc = "show options",
        },
        ["toggle_live_update"] = {
          map = "uu",
          cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
          desc = "update when vim writes to file",
        },
        ["change_view_mode"] = {
          map = "uv",
          cmd = "<cmd>lua require('spectre').change_view()<CR>",
          desc = "change result view mode",
        },
        ["toggle_ignore_case"] = {
          map = "ui",
          cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
          desc = "toggle ignore case",
        },
        ["toggle_ignore_hidden"] = {
          map = "uh",
          cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
          desc = "toggle search hidden",
        },
        ["change_replace_sed"] = {
          map = "us",
          cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
          desc = "use sed to replace",
        },
        ["change_replace_oxi"] = {
          map = "ux",
          cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
          desc = "use oxi to replace",
        },
      },
    },
  },

  -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists
  -- usage:
  -- 		:Trouble {mode}						-- document_diagnostics| workspace_diagnostics| lsp_references | lsp_definitions | lsp_type_definitions | quickfix | loclist
  -- 		:TroubleToggle {mode}
  {
    "folke/trouble.nvim",
    cmd = {
      "Trouble",
      "TroubleToggle",
    },
    keys = {
      { "<leader>at", "<cmd>TroubleToggle<cr>", desc = "Trouble" },
      { "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document diagnostics(Trouble)" },
      { "<leader>tD", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace diagnostics(Trouble)" },
      { "<leader>tr", "<cmd>TroubleToggle lsp_references<cr>", desc = "References(Trouble)" },
      { "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix(Trouble)" },
      {
        "[q",
        function()
          if require("trouble").is_open() then
            require("trouble").previous({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "]q",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Next trouble/quickfix item",
      },
      {
        "[Q",
        function()
          if require("trouble").is_open() then
            require("trouble").first({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cfirst)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "First trouble/quickfix item",
      },
      {
        "]Q",
        function()
          if require("trouble").is_open() then
            require("trouble").last({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.clast)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Last trouble/quickfix item",
      },
    },
    opts = function()
      local trouble = require("trouble.providers.telescope")
      return {
        use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
        -- auto_open = true, -- automatically open the list when you have diagnostics, which takes focus from other window(LAZY's Update)
        auto_close = true, -- automatically close the list when you have no diagnostics
        defaults = {
          mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
          },
        },
      }
    end,
  },

  {
    -- highlight and search for todo comments like TODO, HACK, BUG, NOTE, FIX, PERF
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },

    cmd = { "TodoTrouble", "TodoTelescope" },
    keys = {
      {
        "]-",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo",
      },
      {
        "[-",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo",
      },
      {
        "<leader>t-",
        "<cmd>TodoTrouble<cr>",
        desc = "Todolist(Trouble)",
      },
      {
        "<leader>t+",
        "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",
        desc = "Todolist(TODO/FIX/FIXME)",
      },
      {
        "<leader>f-",
        "<cmd>TodoTelescope<cr>",
        desc = "Todolist",
      },
      {
        "<leader>f+",
        "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",
        desc = "Todolist(TODO/FIX/FIXME)",
      },
    },

    config = function()
      require("todo-comments").setup()
    end,
  },
}
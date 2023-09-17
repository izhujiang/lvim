local util = require("util")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

lvim.builtin.telescope.defaults = {
  prompt_prefix = " ",
  selection_caret = " ",
  mappings = {
    i = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,

      -- ["<c-t>"] = function(...)
      -- 	return trouble.open_with_trouble(...)
      -- end,
      -- ["<a-t>"] = function(...)
      -- 	return trouble.open_selected_with_trouble(...)
      -- end,
      ["<a-i>"] = function()
        local line = action_state.get_current_line()
        util.telescope("find_files", { no_ignore = true, default_text = line })()
      end,
      ["<a-h>"] = function()
        local line = action_state.get_current_line()
        util.telescope("find_files", { hidden = true, default_text = line })()
      end,
      ["<C-Down>"] = function(...)
        return actions.cycle_history_next(...)
      end,
      ["<C-Up>"] = function(...)
        return actions.cycle_history_prev(...)
      end,
      ["<C-f>"] = function(...)
        return actions.preview_scrolling_down(...)
      end,
      ["<C-b>"] = function(...)
        return actions.preview_scrolling_up(...)
      end,
      ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
      ["<esc>"] = actions.close,
    },
    n = {
      ["q"] = actions.close,
    },
  },
  sorting_strategy = "ascending", -- display results top->bottom
  layout_strategy = "horizontal",
  layout_config = {
    anchor = "N",
    height = 0.9,
    width = 0.9,
    prompt_position = "top",
    preview_cutoff = 80, -- preview disable when column less than preview_cutoff
  },
}

lvim.builtin.telescope.pickers = vim.tbl_extend("force", lvim.builtin.telescope.pickers, {
  autocommands = {
    layout_config = {
      preview_width = 0.5,
    },
  },
  buffers = {
    layout_config = {
      preview_width = 0.6,
    },
  },
  colorscheme = {
    enable_preview = true,
    layout_config = {
      preview_width = 0.6,
    },
  },
  current_buffer_fuzzy_find = {
    layout_config = {
      preview_width = 0.5,
    },
  },
  diagnostics = {
    layout_config = {
      preview_width = 0.6,
    },
  },
  find_files = {
    hidden = true,
    layout_config = {
      preview_width = 0.6,
    },
  },
  git_files = {
    hidden = true,
    show_untracked = true,
    layout_config = {
      preview_width = 0.6,
    },
  },
  git_branches = {
    layout_config = {
      preview_width = 0.6,
    },
  },
  git_commit = {
    layout_config = {
      preview_width = 0.6,
    },
  },
  git_status = {
    layout_config = {
      preview_width = 0.6,
    },
  },
  grep_string = {
    layout_config = {
      preview_width = 0.6,
    },
  },
  help_tags = {
    layout_config = {
      preview_width = 0.6,
    },
  },
  live_grep = {
    layout_config = {
      preview_width = 0.6,
    },
  },
  lsp_document_symbols = {
    layout_config = {
      preview_width = 0.6,
    },
  },
  lsp_workspace_symbols = {
    layout_config = {
      preview_width = 0.6,
    },
  },
  marks = {
    layout_config = {
      preview_width = 0.6,
    },
  },
  man_pages = {
    layout_config = {
      preview_width = 0.6,
    },
  },
  oldfiles = {
    layout_config = {
      preview_width = 0.5,
    },
  },
})

lvim.builtin.telescope.extensions = {
  fzf = {
    fuzzy = true, -- false will only do exact matching
    override_generic_sorter = true, -- override the generic sorter
    override_file_sorter = true, -- override the file sorter
    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
  },
}

lvim.builtin.telescope.on_config_done = function(telescope)
  -- fzf and projects are loaded via lunarvim
  -- pcall(telescope.load_extension, "fzf")
  -- pcall(telescope.load_extension, "projects")
  -- any other extensions loading
  pcall(telescope.load_extension, "notify")
end

-- telescope actions
local telescope_builtin = require("telescope.builtin")
lvim.builtin.which_key.mappings["/"] = { telescope_builtin.current_buffer_fuzzy_find, "Fuzzy Find(buf)" } -- "Search in Current File"
lvim.builtin.which_key.mappings[":"] = { telescope_builtin.commands, "Commanads" }
lvim.builtin.which_key.mappings["'"] = { telescope_builtin.marks, "Marks" }
lvim.builtin.which_key.mappings['"'] = { telescope_builtin.registers, "Registers" }

lvim.builtin.which_key.mappings["f"] = {
  name = "+Fuzzy_Find",
  a = { telescope_builtin.autocommands, "Autocommands" },
  b = { telescope_builtin.buffers, "Buffers" },
  B = { telescope_builtin.git_branches, "Checkout Branch" },
  c = { telescope_builtin.commands, "Commands" },
  C = { telescope_builtin.command_history, "Command History" },
  d = {
    function()
      telescope_builtin.diagnostics({ bufnr = 0 })
    end,
    "Diagnostics(Document)",
  },
  D = { telescope_builtin.diagnostics, "Diagnostics(Workspace)" },
  f = { require("util").telescope("files"), "Files" },
  g = { telescope_builtin.git_status, "Git Status" },
  G = { telescope_builtin.git_commits, "Git Commits" },
  h = { telescope_builtin.help_tags, "Help Pages" },
  -- H = { telescope_builtin.highlights, "Highlight Groups" },
  k = { telescope_builtin.keymaps, "Keybindings" },
  l = { telescope_builtin.live_grep, "Live Grep" },
  L = { telescope_builtin.resume, "Last Find" },
  m = { telescope_builtin.man_pages, "Man Pages" },
  p = { "<CMD>Telescope projects<CR>", "Projects" },
  q = { telescope_builtin.quickfix, "Quickfix" },
  r = { telescope_builtin.oldfiles, "Recent Files" },
  s = { telescope_builtin.lsp_document_symbols, "Symbols(Document)" },
  S = { telescope_builtin.lsp_workspace_symbols, "Symbols(Workspace)" },
  w = { telescope_builtin.grep_string, "Grep String" },
}
lvim.builtin.which_key.mappings["s"] = { telescope_builtin.live_grep, "Live Grep" }

lvim.builtin.which_key.mappings["l"] = vim.tbl_extend("keep", lvim.builtin.which_key.mappings["l"], {
  s = { telescope_builtin.lsp_document_symbols, "Document Symbols" },
  S = { telescope_builtin.lsp_workspace_symbols, "Workspace Symbols" },
  R = { telescope_builtin.lsp_references, "References" },
  c = { telescope_builtin.lsp_incoming_calls, "Incoming calls" },
  C = { telescope_builtin.lsp_outcoming_calls, "Outcoming calls" },
  d = {
    function()
      telescope_builtin.diagnostics({ bufnr = 0 })
    end,
    "Workspace Diagnostics",
  },
  D = { telescope_builtin.diagnostics, "Workspace Diagnostics" },
})

lvim.builtin.which_key.mappings["o"] = vim.tbl_extend("keep", lvim.builtin.which_key.mappings["o"], {
  o = { telescope_builtin.vim_options, "Vim Options" },
})

lvim.builtin.which_key.mappings["p"] = vim.tbl_extend("keep", lvim.builtin.which_key.mappings["p"], {
  c = { telescope_builtin.colorscheme, "Colorscheme" },
})
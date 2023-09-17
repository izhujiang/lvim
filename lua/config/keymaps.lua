-- 2.1 NeoVim mappings (regular keybindings).
-- lvim.keys.normal_mode["<S-x>"] = ":BufferKill<CR>" -- X closes a buffer
-- lvim.keys.normal_mode["<C-h>"] = false             -- Removing default mappings

-- 2.2 LSP Bindings (buffer mapping)
-- lvim.lsp.buffer_mappings.[normal|visual|insert]_mode['K'] = { vim.lsp.buf.hover, "Show documentation" }

-- LSP bindings take precedence over regular keybindings. So in order to use a key for a regular binding, we have to remove it first
-- lvim.lsp.buffer_mappings.normal_mode['K'] = nil    -- Remove a LSP binding
-- lvim.keys.normal_mode['K'] = "<Cmd>echo Okay!<CR>"

-- 2.3 Whichkey Bindings
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["tP"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
-- lvim.builtin.which_key.mappings = { ["h"] = { '<cmd>let @/=""<CR>', "No Highlight" } }
-- lvim.builtin.which_key.mappings['w'] = {}          -- Removing a which_key mapping

-- 2.4 miscellaneousBindings
-- lvim.builtin.terminal.open_mapping = "<c-t>" -- default: <C-\>

-- Disable builtin keybinds
lvim.keys.normal_mode[","] = "<Nop>"
lvim.keys.normal_mode["<Up>"] = "<Nop>"
lvim.keys.normal_mode["<Down>"] = "<Nop>"
lvim.keys.normal_mode["<Left>"] = "<Nop>"
lvim.keys.normal_mode["<Right>"] = "<Nop>"

-- better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move Lines (LunarVim builtin feature)
-- vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- ]/[ switch buffers, tabs, quickfix, loclist
-- Buffers
lvim.keys.normal_mode["]b"] = { vim.cmd.bnext, { desc = "Next Buffer" } }
lvim.keys.normal_mode["[b"] = { vim.cmd.bprevious, { desc = "Prev Buffer" } }
lvim.keys.normal_mode["]B"] = { vim.cmd.blast, { desc = "Last Buffer" } }
lvim.keys.normal_mode["[B"] = { vim.cmd.bfirst, { desc = "First Buffer" } }

-- Tabs
lvim.keys.normal_mode["]t"] = { vim.cmd.tabnext, { desc = "Next Tab" } }
lvim.keys.normal_mode["[t"] = { vim.cmd.tabprevious, { desc = "Previous Tab" } }
lvim.keys.normal_mode["]T"] = { vim.cmd.tablast, { desc = "Last Tab" } }
lvim.keys.normal_mode["[T"] = { vim.cmd.tabfirst, { desc = "First Tab" } }

-- ]c, [c for jump to diffs (builtin) or gitsigns

-- Quickfix and Loclist quickfix (or trouble.nvim)
lvim.keys.normal_mode["]q"] = { vim.cmd.cnext, { desc = "Next Quickfix Item" } }
lvim.keys.normal_mode["[q"] = { vim.cmd.cprevious, { desc = "Previous Quickfix Item" } }
lvim.keys.normal_mode["]Q"] = { vim.cmd.clast, { desc = "Last Quickfix Item" } }
lvim.keys.normal_mode["[Q"] = { vim.cmd.cfirst, { desc = "First Quickfix Item" } }

lvim.keys.normal_mode["]l"] = { vim.cmd.lnext, { desc = "Next Loclist Item" } }
lvim.keys.normal_mode["[l"] = { vim.cmd.lprevious, { desc = "Prev Loclist Item" } }
lvim.keys.normal_mode["]L"] = { vim.cmd.llast, { desc = "Last Loclist Item" } }
lvim.keys.normal_mode["[L"] = { vim.cmd.lfirst, { desc = "First Loclist Item" } }

-- ]-, [-, ]+, [+ for jump to todo-comments
-- ]d, [d for jump to diagnostics
-- ]r, [r for jump to references

-- CTRL- keybindings
-- Windows
-- Move to window using the <ctrl> hjkl keys
-- " Should disable ^<-, ^->, ^↑, ^↓ in MissionControl shortcuts (macos)
-- builtin <C-h,j,k,l> for alternate active window (normal_mode)
-- vim.keymap.set({ "n", "i", "t" }, "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Go to left window", remap = false })
-- vim.keymap.set({ "n", "i", "t" }, "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Go to lower window", remap = false })
-- vim.keymap.set({ "n", "i", "t" }, "<C-k>", "<Cmd>wincmd k<CR>", { desc = "Go to upper window", remap = false })
-- vim.keymap.set({ "n", "i", "t" }, "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Go to right window", remap = false })
lvim.keys.insert_mode["<C-h>"] = { "<Cmd>wincmd h<CR>", { desc = "Go to Left Window", remap = false } }
lvim.keys.insert_mode["<C-j>"] = { "<Cmd>wincmd j<CR>", { desc = "Go to Lower Window", remap = false } }
lvim.keys.insert_mode["<C-k>"] = { "<Cmd>wincmd k<CR>", { desc = "Go to Upper Window", remap = false } }
lvim.keys.insert_mode["<C-l>"] = { "<Cmd>wincmd l<CR>", { desc = "Go to Right Window", remap = false } }

lvim.keys.term_mode["<C-h>"] = { "<Cmd>wincmd h<CR>", { desc = "Go to Left Window", remap = false } }
lvim.keys.term_mode["<C-j>"] = { "<Cmd>wincmd j<CR>", { desc = "Go to Lower Window", remap = false } }
lvim.keys.term_mode["<C-k>"] = { "<Cmd>wincmd k<CR>", { desc = "Go to Upper Window", remap = false } }
lvim.keys.term_mode["<C-l>"] = { "<Cmd>wincmd l<CR>", { desc = "Go to Right Window", remap = false } }

-- Resize window using <ctrl> arrow keys
lvim.keys.normal_mode["<C-Up>"] = { "<Cmd>resize +2<CR>", { desc = "Increase Window Height" } }
lvim.keys.normal_mode["<C-Down>"] = { "<Cmd>resize -2<CR>", { desc = "Decrease Window Height" } }
lvim.keys.normal_mode["<C-Left>"] = { "<Cmd>vertical resize -5<CR>", { desc = "Decrease Window Width" } }
lvim.keys.normal_mode["<C-Right>"] = { "<Cmd>vertical resize +5<CR>", { desc = "Increase Window Width" } }

lvim.keys.term_mode["<esc><esc>"] = { "<c-\\><c-n>", { desc = "Enter Normal Mode" } }

-- Search and substitute
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- n to always search forward and N backward whenever using / or ?
-- vim.keymap.set({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- vim.keymap.set({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
lvim.keys.normal_mode["n"] = { "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" } }
lvim.keys.normal_mode["N"] = { "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" } }
lvim.keys.visual_mode["n"] = { "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" } }
lvim.keys.visual_mode["N"] = { "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" } }

lvim.keys.normal_mode["&&"] = { "<Cmd>&&<CR>", { desc = "Execute Last Substitute" } }
lvim.keys.visual_mode["&&"] = { "<Cmd>'<,'>&&<CR><Esc>", { desc = "Execute Last Substitute" } }
lvim.keys.normal_mode["<Esc>"] = { vim.cmd.nohlsearch, { desc = "Escape and Clear Hlsearch" } }

-- better paste
lvim.keys.visual_mode["p"] = { "P", { desc = "Paste" } }

-- better lsp
-- -------------------------------------------------------------------------------------------
-- use builtin keybindings
-- [
-- lvim.lsp.buffer_mappings.normal_mode["K"] = { vim.lsp.buf.hover, "Show hover" }
-- lvim.lsp.buffer_mappings.normal_mode["gd"] = { vim.lsp.buf.definition, "Goto definition" }
-- lvim.lsp.buffer_mappings.normal_mode["gD"] = { vim.lsp.buf.declaration, "Goto Declaration" }
-- lvim.lsp.buffer_mappings.normal_mode["gr"] = { vim.lsp.buf.references, "Goto references" }
-- lvim.lsp.buffer_mappings.normal_mode["gI"] = { vim.lsp.buf.implementation, "Goto Implementation" }
-- lvim.lsp.buffer_mappings.normal_mode["gs"] = { vim.lsp.buf.signature_help, "Show signature_help" }
-- lvim.lsp.buffer_mappings.normal_mode["gl"] = { vim.diagnostic.open_float, "Show line diagnostics" }

-- lvim.lsp.buffer_mappings.normal_mode["K"] = { vim.lsp.buf.hover, "Show Documentation" }
-- lvim.lsp.buffer_mappings.normal_mode["[d"] = { vim.diagnostic.goto_prev, "Previous Diagnostic" }
-- lvim.lsp.buffer_mappings.normal_mode["]d"] = { vim.diagnostic.goto_next, "Next Diagnostic" }
-- ]

-- Command mode
lvim.keys.command_mode["<C-o>"] = { "<C-f>", { desc = "Open Command-line Window" } }
lvim.keys.command_mode["<C-k>"] = { "<Up>", { desc = "Previous Command" } }
lvim.keys.command_mode["<C-j>"] = { "<Down>", { desc = "Next Command" } }

-- TODO: using lua
vim.keymap.set("c", "%%", "getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'", { expr = true, silent = false })

vim.cmd.iabbrev("adn and")
vim.cmd.iabbrev("waht what")
vim.cmd.iabbrev("@@ m.zhujiang@gmail.com")
vim.cmd.iabbrev("ccopy Copyright 2017 Jiang Zhu, all rights reserved.")

vim.cmd.cnoreabbrev("W! w!")
vim.cmd.cnoreabbrev("Q! q!")
vim.cmd.cnoreabbrev("Qall! qall!")
vim.cmd.cnoreabbrev("Wq wq")
vim.cmd.cnoreabbrev("Wa wa")
vim.cmd.cnoreabbrev("wQ wq")
vim.cmd.cnoreabbrev("WQ wq")

vim.cmd.cnoreabbrev("<expr> make 'silent make <Bar> redraw!'")
-- rewrite grep command to run silently without press Enter to continue.
vim.cmd.cnoreabbrev("<expr> grep  (getcmdtype() ==# ':' && getcmdline() =~# '^grep')  ? 'silent grep': 'grep'")
vim.cmd.cnoreabbrev("<expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep' : 'lgrep'")

-- ----------------------------------------------------------------------------------------
lvim.builtin.which_key.mappings["/"] = {}
lvim.builtin.which_key.mappings["b"] = {}
lvim.builtin.which_key.mappings["c"] = {}
lvim.builtin.which_key.mappings["d"] = {}
lvim.builtin.which_key.mappings["e"] = {}
lvim.builtin.which_key.mappings["h"] = {}
lvim.builtin.which_key.mappings["l"] = {}
lvim.builtin.which_key.mappings["p"] = {}
lvim.builtin.which_key.mappings["s"] = {}
lvim.builtin.which_key.mappings["L"].r = {}
lvim.builtin.which_key.mappings["T"] = {}

-- TODO: config default keys
lvim.builtin.which_key.defaults = {
  mode = { "n" },
  ["g"] = { name = "+Goto" },
  ["]"] = { name = "+Next" },
  ["["] = { name = "+Prev" },
  ["<leader>a"] = { name = "+Alternate" },
  ["<leader>c"] = { name = "+Code" },
  ["<leader>d"] = { name = "+Diagnostics/Debug" },
  ["<leader>f"] = { name = "+Find" },
  ["<leader>g"] = { name = "+Git" },
  ["<leader>h"] = { name = "+Hunks" },
  ["<leader>l"] = { name = "+LSP" },
  ["<leader>o"] = { name = "+Options" },
  ["<leader>p"] = { name = "+Pick" },
  ["<leader>t"] = { name = "+Trouble/Test/Terminal" },
}

-- buffer and window actions
lvim.builtin.which_key.mappings["w"] = { vim.cmd.write, "Save" }
lvim.builtin.which_key.mappings["x"] = { "<Cmd>BufferKill<CR>", "Close" }
-- lvim.builtin.which_key.mappings["q"] = { "<cmd>confirm q<CR>", "Quit" }
lvim.builtin.which_key.mappings["|"] = { vim.cmd.vsplit, "VSplit Window" }
lvim.builtin.which_key.mappings["-"] = { vim.cmd.split, "Split Window" }

-- better make
lvim.builtin.which_key.mappings["b"] = { vim.cmd.make, "Make (Compile)" }

lvim.builtin.which_key.mappings["a"] = {
  name = "Alternate",
  b = { "<Cmd>buf #<CR>", "Buffer" },    -- go to last buffer
  w = { "<Cmd>wincmd p<CR>", "Window" }, -- go to last window

  -- s = { require("spectre").toggle, "Replace in Files" },
  -- t = { "<cmd>TroubleToggle<cr>", "Trouble" },
  -- T = {
  --   function()
  --     require("neotest").summary.toggle()
  --   end,
  --   "Test Summary",
  -- },
  -- o = {
  --   function()
  --     require("neotest").output_panel.toggle()
  --   end,
  --   "Test Output Panel",
  -- },
}

lvim.builtin.which_key.mappings["d"] = {
  name = "Diagnostic/Debug",
}
--   f = {
--     function()
--       local float = vim.diagnostic.config().float
--       if float then
--         local config = type(float) == "table" and float or {}
--         config.scope = "line"
--         vim.diagnostic.open_float(config)
--       end
--     end,
--     "Open_float",
--   },
--   q = { vim.diagnostic.setqflist, "Quickfix" },
--   l = { vim.diagnostic.setloclist, "Loclist" },
--   -- t = {
--   --   function()
--   --     require("neotest").run.run({ strategy = "dap" })
--   --   end,
--   --   "Debug the nearest test",
--   -- },
-- }

lvim.builtin.which_key.mappings["e"] = {
  name = "+Explore",
}
--   e = {
--     function()
--       require("neo-tree.command").execute({ toggle = true, dir = require("util").get_root() })
--     end,
--     "Files(root)",
--   },
--   c = {
--     function()
--       require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
--     end,
--     "Files(cwd)",
--   },
--   b = {
--     function()
--       require("neo-tree.command").execute({ source = "buffers", toggle = true })
--     end,
--     "Buffers",
--   },
--   g = {
--     function()
--       require("neo-tree.command").execute({ source = "git_status", toggle = true, position = "left" })
--     end,
--     "Git_status",
--   },
--   s = {
--     function()
--       require("neo-tree.command").execute({ source = "document_symbols", toggle = true, position = "left" })
--     end,
--     "Symbols(document)",
--   },
-- }

-- -- telescope actions
-- local telescope_builtin = require("telescope.builtin")
-- lvim.builtin.which_key.mappings["/"] = { telescope_builtin.current_buffer_fuzzy_find, "Fuzzy Find(buf)" } -- "Search in Current File"
-- lvim.builtin.which_key.mappings[":"] = { telescope_builtin.commands, "Commanads" }
-- lvim.builtin.which_key.mappings["'"] = { telescope_builtin.marks, "Marks" }
-- lvim.builtin.which_key.mappings['"'] = { telescope_builtin.registers, "Registers" }

lvim.builtin.which_key.mappings["f"] = {
  name = "+Fuzzy_Find",
}
--   a = { telescope_builtin.autocommands, "Autocommands" },
--   b = { telescope_builtin.buffers, "Buffers" },
--   B = { telescope_builtin.git_branches, "Checkout Branch" },
--   c = { telescope_builtin.commands, "Commands" },
--   C = { telescope_builtin.command_history, "Command History" },
--   d = {
--     function()
--       telescope_builtin.diagnostics({ bufnr = 0 })
--     end,
--     "Diagnostics(Document)",
--   },
--   D = { telescope_builtin.diagnostics, "Diagnostics(Workspace)" },
--   f = { telescope_builtin.find_files, "Files" },
--   g = { telescope_builtin.git_status, "Git Status" },
--   G = { telescope_builtin.git_commits, "Git Commits" },
--   h = { telescope_builtin.help_tags, "Help Pages" },
--   -- H = { telescope_builtin.highlights, "Highlight Groups" },
--   k = { telescope_builtin.keymaps, "Keybindings" },
--   l = { telescope_builtin.live_grep, "Live Grep" },
--   L = { telescope_builtin.resume, "Last Find" },
--   m = { telescope_builtin.man_pages, "Man Pages" },
--   p = { "<CMD>Telescope projects<CR>", "Projects" },
--   q = { telescope_builtin.quickfix, "Quickfix" },
--   r = { telescope_builtin.oldfiles, "Recent Files" },
--   s = { telescope_builtin.lsp_document_symbols, "Symbols(document)" },
--   S = { telescope_builtin.lsp_workspace_symbols, "Symbols(workspace)" },
--   w = { telescope_builtin.grep_string, "Grep String" },
--   ["-"] = { "<Cmd>TodoTelescope<CR>", "Todolist" },
--   ["+"] = { "<Cmd>TodoTelescope keywords=TODO,FIX,FIXME<CR>", "Todolist(TODO,FIX,FIXME)" },
-- }
-- lvim.builtin.which_key.mappings["s"] = { telescope_builtin.live_grep, "Live Grep" }

-- Search and replace
-- local spectre = require("spectre")

lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
}
--   w = {
--     function()
--       spectre.open_visual({ select_word = true })
--     end,
--     "Replace Current Word",
--   },

--   W = {
--     function()
--       spectre.open_file_search({ select_word = true })
--     end,
--     "Replace in Current File",
--   },
-- }

-- lvim.builtin.which_key.vmappings["r"] = { '<esc><cmd>lua require("spectre").open_visual()<CR>', "Replace Current Word" }

lvim.builtin.which_key.mappings["gU"] = {
  function()
    vim.cmd.nohlsearch()
    vim.cmd.diffupdate()
  end,
  "Diff Update",
}
lvim.builtin.which_key.mappings["l"] = {
  name = "LSP",
  -- s = { telescope_builtin.lsp_document_symbols, "Document Symbols" },
  -- S = { telescope_builtin.lsp_workspace_symbols, "Workspace Symbols" },
  -- R = { telescope_builtin.lsp_references, "References" },
  -- c = { telescope_builtin.lsp_incoming_calls, "Incoming calls" },
  -- C = { telescope_builtin.lsp_outcoming_calls, "Outcoming calls" },
  -- h = { vim.lsp.buf.signature_help, "Signature help" },

  -- f = { vim.lsp.format, "Format" },
  -- r = { vim.lsp.buf.rename, "Rename" },
  -- a = { vim.lsp.buf.code_action, "Code Action" },
  -- l = { vim.lsp.codelens.run, "CodeLens Action" },

  -- d = {
  --   function()
  --     telescope_builtin.diagnostics({ bufnr = 0 })
  --   end,
  --   "Workspace Diagnostics",
  -- },
  -- D = { telescope_builtin.diagnostics, "Workspace Diagnostics" },
  -- j = { vim.diagnostic.goto_next, "Next Diagnostic" },
  -- k = { vim.diagnostic.goto_prev, "Prev Diagnostic" },
  -- q = { vim.diagnostic.setloclist, "Quickfix" },

  i = { -- highlights under cursor, Show all the items at a given buffer position.
    vim.show_pos,
    "Inspect",
  },
}

-- TODO: keymappings for test
lvim.builtin.which_key.mappings["t"] = {
  name = "Trouble/Test",
  -- r = { "<cmd>TroubleToggle lsp_references<cr>", "References(Trouble)" },
  -- d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics(Trouble)" },
  -- D = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics(Trouble)" },
  -- q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix(Trouble)" },
  -- ["-"] = { "<cmd>TodoTrouble<cr>", "Todolist(Trouble)" },
  -- ["+"] = { "<cmd>TodoTrouble<cr>", "Todolist(TODO,FIX,FIXME)(Trouble)" },

  -- t = {
  --   function()
  --     require("neotest").run.run(vim.fn.expand("%"))
  --   end,
  --   "Test current file",
  -- },
  -- T = {
  --   function()
  --     require("neotest").run.run(vim.loop.cwd())
  --   end,
  --   "Test all files(cwd)",
  -- },
  -- f = {
  --   function()
  --     require("neotest").run.run()
  --   end,
  --   "Run the nearest test",
  -- },
  -- s = {
  --   function()
  --     require("neotest").run.stop()
  --   end,
  --   "Stop test",
  -- },
  -- a = {
  --   function()
  --     require("neotest").run.attach()
  --   end,
  --   "Attach to the nearest test",
  -- },
  -- o = {
  --   function()
  --     require("neotest").output.open({ enter = true, auto_close = true })
  --   end,
  --   "Output(Test)",
  -- },
  -- S = {
  --   function()
  --     require("neotest").summary.open({ enter = true, auto_close = true })
  --   end,
  --   "Summary(Test)",
  -- },
}

local Util = require("util")
-- options (un-)
lvim.builtin.which_key.mappings["o"] = {
  name = "Options",
  -- o = { telescope_builtin.vim_options, "Vim Options" },

  -- On/off
  c = {
    function()
      local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
      Util.toggle("conceallevel", false, { 0, conceallevel })
    end,
    "Conceal",
  },
  d = { Util.toggle_diagnostics, "Diagnostics" },
  h = {
    function()
      vim.lsp.inlay_hint(0, nil)
    end,
    "Inlay Hints",
  },
  l = {
    function()
      Util.toggle("relativenumber", true)
      Util.toggle("number")
    end,
    "Line Numbers",
  },
  s = {
    function()
      Util.toggle("spell")
    end,
    "Spelling",
  },
  w = {
    function()
      Util.toggle("wrap")
    end,
    "Wrap",
  },
}

-- TODO: pickup window
lvim.builtin.which_key.mappings["p"] = {
  name = "Pick",
  --   b = { "<cmd>BufferLinePick<cr>", "Buffer" },
  --   B = { "<cmd>BufferLinePickClose<cr>", "Buffer(Close )" },
  --   -- c = { telescope_builtin.colorscheme, "Colorscheme" },
}

lvim.builtin.which_key.mappings["I"] = {
  name = "Info",
  L = { "<cmd>LvimInfo<cr>", "LvimInfo" },
  l = { "<cmd>LspInfo<cr>", "Lsp" },
  m = { "<cmd>Mason<cr>", "Mason" },
  t = { "<cmd>TSConfigInfo<cr>", "Treesitter" },
}

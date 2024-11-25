-- If you want to (re)map a keybinding that starts with <leader>, use Whichkey Bindings.
-- If the bindings are LSP (intellisense) related, use LSP Bindings.
-- In all other cases, use NeoVim mappings
--
-- To see if a particular key has already been bound:
-- :verbose map <TAB>
-- :nmap for normal mode mappings
-- :vmap for visual mode mappings
-- :imap for insert mode mappings
-- :map for list every mapping

-- 2.1 NeoVim mappings (regular keybindings).
-- lvim.keys.normal_mode["<S-x>"] = "<cmd>BufferKill<cr>" -- X closes a buffer
-- lvim.keys.normal_mode["<C-h>"] = false             -- Removing default mappings

-- 2.2 LSP Bindings (buffer mapping)
-- lvim.lsp.buffer_mappings.[normal|visual|insert]_mode['K'] = { vim.lsp.buf.hover, "Show documentation" }

-- LSP bindings take precedence over regular keybindings. So in order to use a key for a regular binding, we have to remove it first
-- lvim.lsp.buffer_mappings.normal_mode['K'] = nil    -- Remove a LSP binding
-- lvim.keys.normal_mode['K'] = "<cmd>echo Okay!<cr>"

-- 2.3 Whichkey Bindings
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "Projects" }
-- lvim.builtin.which_key.mappings["tP"] = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "Projects" }
-- lvim.builtin.which_key.mappings = { ["h"] = { '<cmd>let @/=""<cr>', "No Highlight" } }
-- lvim.builtin.which_key.mappings['w'] = {}          -- Removing a which_key mapping

-- 2.4 miscellaneousBindings

-- Disable builtin keybindings
lvim.keys.insert_mode["<A-j>"] = false
lvim.keys.insert_mode["<A-k>"] = false
lvim.keys.insert_mode["<A-Up>"] = false
lvim.keys.insert_mode["<A-Down>"] = false
lvim.keys.insert_mode["<A-Left>"] = false
lvim.keys.insert_mode["<A-Right>"] = false

lvim.keys.normal_mode["<Up>"] = false
lvim.keys.normal_mode["<Down>"] = false
lvim.keys.normal_mode["<Left>"] = false
lvim.keys.normal_mode["<Right>"] = false

lvim.keys.normal_mode["<C-Up>"] = false
lvim.keys.normal_mode["<C-Down>"] = false
lvim.keys.normal_mode["<C-Left>"] = false
lvim.keys.normal_mode["<C-Right>"] = false

lvim.keys.normal_mode["<C-h>"] = false
lvim.keys.normal_mode["<C-j>"] = false
lvim.keys.normal_mode["<C-k>"] = false
lvim.keys.normal_mode["<C-l>"] = false

lvim.keys.normal_mode["<A-j>"] = false
lvim.keys.normal_mode["<A-k>"] = false
lvim.keys.normal_mode["<C-q>"] = false

lvim.keys.term_mode["<C-h>"] = false
lvim.keys.term_mode["<C-j>"] = false
lvim.keys.term_mode["<C-k>"] = false
lvim.keys.term_mode["<C-l>"] = false

lvim.keys.visual_block_mode["<A-j>"] = false
lvim.keys.visual_block_mode["<A-k>"] = false

-- --------------------------------------------------------------
lvim.keys.operator_pending_mode = {}
lvim.keys.normal_mode["<Bslash>"] = ","

-- Shortcuts for <M-...> toggle and more

lvim.keys.normal_mode["<M-b>"] = {
  function()
    vim.cmd.buffer("#")
  end,
  { desc = "Recent Buffer" },
}

lvim.keys.normal_mode["<A-e>"] = {
  "<cmd>NvimTreeToggle<cr>",
  { desc = "Explorer" }
}

lvim.keys.normal_mode["<A-q>"] = {
  function()
    toggle_qf_loc_list("Quickfix")
  end,
  { desc = "Toggle Quickfix" },
}

lvim.keys.normal_mode["<A-Q>"] = {
  function()
    toggle_qf_loc_list("location")
  end,
  { desc = "Toggle Loclist" },
}
if lvim.builtin.illuminate.active then
  lvim.keys.normal_mode["<M-r>"] = {
    "<cmd>IlluminateToggleBuf<cr>",
    { desc = "Illuminate/Reference(Buffer)" },
  }
  lvim.keys.normal_mode["<M-R>"] = {
    "<cmd>IlluminateToggle<cr>",
    { desc = "Illuminate/Reference" },
  }
end

lvim.keys.normal_mode["<A-t>"] = {
  "<cmd>TSContextToggle<cr>",
  { desc = "Toggle TSContext" },
}

-- Goto window <A-h/j/k/l> , equal to "<C-\\><C-N><C-w>[hjkl]",
local wincmd = function(cmd)
  return function()
    vim.cmd.wincmd(cmd)
  end
end
lvim.keys.normal_mode["<A-w>"] = { wincmd("p"), { desc = "Recent Window", remap = false } }
lvim.keys.insert_mode["<A-w>"] = { wincmd("p"), { desc = "Recent Window", remap = false } }
lvim.keys.term_mode["<A-w>"] = { wincmd("p"), { desc = "Recent Window", remap = false } }

-- Windows
lvim.keys.normal_mode["<A-h>"] = { wincmd("h"), { desc = "Goto Left", remap = false } }
lvim.keys.normal_mode["<A-j>"] = { wincmd("j"), { desc = "Goto Lower", remap = false } }
lvim.keys.normal_mode["<A-k>"] = { wincmd("k"), { desc = "Goto Upper", remap = false } }
lvim.keys.normal_mode["<A-l>"] = { wincmd("l"), { desc = "Goto Right", remap = false } }
lvim.keys.insert_mode["<A-h>"] = { wincmd("h"), { desc = "Goto Left", remap = false } }
lvim.keys.insert_mode["<A-j>"] = { wincmd("j"), { desc = "Goto Lower", remap = false } }
lvim.keys.insert_mode["<A-k>"] = { wincmd("k"), { desc = "Goto Upper", remap = false } }
lvim.keys.insert_mode["<A-l>"] = { wincmd("l"), { desc = "Goto Right", remap = false } }
lvim.keys.term_mode["<A-h>"] = { wincmd("h"), { desc = "Goto Left", remap = false } }
lvim.keys.term_mode["<A-j>"] = { wincmd("j"), { desc = "Goto Lower", remap = false } }
lvim.keys.term_mode["<A-k>"] = { wincmd("k"), { desc = "Goto Upper", remap = false } }
lvim.keys.term_mode["<A-l>"] = { wincmd("l"), { desc = "Goto Right", remap = false } }

-- Resize window with <A-arrow>
lvim.keys.normal_mode["<A-Up>"] = { "<cmd>resize +2<cr>", { desc = "Height++" } }
lvim.keys.normal_mode["<A-Down>"] = { "<cmd>resize -2<cr>", { desc = "Height--" } }
lvim.keys.normal_mode["<A-Left>"] = { "<cmd>vertical resize -2<cr>", { desc = "Width--" } }
lvim.keys.normal_mode["<A-Right>"] = { "<cmd>vertical resize +2<cr>", { desc = "Width++" } }

lvim.keys.insert_mode["<A-Up>"] = { "<Esc><cmd>resize +2<cr>gi", { desc = "Height++" } }
lvim.keys.insert_mode["<A-Down>"] = { "<Esc><cmd>resize -2<cr>gi", { desc = "Height--" } }
lvim.keys.insert_mode["<A-Left>"] = { "<Esc><cmd>vertical resize -2<cr>gi", { desc = "Width--" } }
lvim.keys.insert_mode["<A-Right>"] = { "<Esc><cmd>vertical resize +2<cr>gi", { desc = "Width--" } }

lvim.keys.term_mode["<A-Up>"] = { "<C-\\><C-n><cmd>resize +2<cr>a", { desc = "Height++" } }
lvim.keys.term_mode["<A-Down>"] = { "<C-\\><C-n><cmd>resize -2<cr>a", { desc = "Height--" } }
lvim.keys.term_mode["<A-Right>"] = { "<C-\\><C-n><cmd>vertical resize +2<cr>a", { desc = "Width--" } }
lvim.keys.term_mode["<A-Left>"] = { "<C-\\><C-n><cmd>vertical resize -2<cr>a", { desc = "Width++" } }

if lvim.builtin.terminal.active then
  -- mode = { "n", "i", "t" },
  local toggle_term_key1 = "<A-1>"
  local toggle_term_key2 = "<A-2>"
  local toggle_term_key3 = "<A-3>"

  lvim.keys.normal_mode[toggle_term_key1] = {
    "<cmd>ToggleTerm direction=horizontal<cr>",
    { desc = "Terminal(Horizontal)" },
  }
  lvim.keys.insert_mode[toggle_term_key1] = lvim.keys.normal_mode[toggle_term_key1]
  lvim.keys.term_mode[toggle_term_key1] = lvim.keys.normal_mode[toggle_term_key1]

  lvim.keys.normal_mode[toggle_term_key2] = {
    "<cmd>ToggleTerm direction=vertical<cr>",
    { desc = "Terminal(Vertical)" },
  }
  lvim.keys.insert_mode[toggle_term_key2] = lvim.keys.normal_mode[toggle_term_key2]
  lvim.keys.term_mode[toggle_term_key2] = lvim.keys.normal_mode[toggle_term_key2]

  lvim.keys.normal_mode[toggle_term_key3] = {
    "<cmd>ToggleTerm direction=float<cr>",
    { desc = "Terminal(Float)" },
  }
  lvim.keys.insert_mode[toggle_term_key3] = lvim.keys.normal_mode[toggle_term_key3]
  lvim.keys.term_mode[toggle_term_key3] = lvim.keys.normal_mode[toggle_term_key3]
end

-- <C-...>

-- clean highlight
lvim.keys.normal_mode["<C-l>"] = { vim.cmd.nohlsearch, { desc = "Clear Hlsearch" } }

lvim.keys.normal_mode["<C-p>"] = { "<cmd>Telescope find_files<cr>", { desc = "Files" } }

-- Move Lines
lvim.keys.normal_mode["<C-j>"] = { ":m .+1<cr>==", { desc = "Move Down" } }
lvim.keys.normal_mode["<C-k>"] = { ":m .-2<cr>==", { desc = "Move Up" } }
lvim.keys.insert_mode["<C-j>"] = { "<esc>:m .+1<cr>==gi", { desc = "Move Down" } }
lvim.keys.insert_mode["<C-k>"] = { "<esc>:m .-2<cr>==gi", { desc = "Move Up" } }
lvim.keys.visual_mode["<C-j>"] = { ":m '>+1<cr>gv=gv", { desc = "Move Down" } }
lvim.keys.visual_mode["<C-k>"] = { ":m '<-2<cr>gv=gv", { desc = "Move Up" } }

-- terminal mode
-- lvim.keys.term_mode["<Esc>"] = { "<c-\\><c-n>", { desc = "Normal Mode" } }
-- lvim.keys.term_mode["<M-[>"] = { "<Esc>", { desc = "<Esc>" } }
-- lvim.keys.term_mode["<C-v><Esc>>"] = { "<Esc>", { desc = "<Esc>" } }
lvim.keys.term_mode["<C-d>"] = {
  function()
    vim.cmd.bdelete({ bang = true })
  end,
  { silent = true, desc = "Close" },
}

-- command mode
lvim.keys.command_mode["<C-o>"] = { "<C-f>", { desc = "Command Window" } }
lvim.keys.command_mode["<C-k>"] = { "<Up>", { desc = "Previous Command" } }
lvim.keys.command_mode["<C-j>"] = { "<Down>", { desc = "Next Command" } }

lvim.keys.command_mode["%%"] = {
  function()
    return vim.fn.getcmdline() == "<cmd>" and vim.fn.expand("%:p:h") .. "/" or "%%"
  end,
  { desc = "Directory", expr = true, silent = false },
}

-- Shortcuts for [ and ]

-- Argument list
lvim.keys.normal_mode["]a"] = { vim.cmd.next, { desc = "Next Argument" } }
lvim.keys.normal_mode["[a"] = { vim.cmd.previous, { desc = "Previous Argument" } }
lvim.keys.normal_mode["]A"] = { vim.cmd.last, { desc = "Last Argument" } }
lvim.keys.normal_mode["[A"] = { vim.cmd.first, { desc = "First Argument" } }
-- Buffers
if lvim.builtin.lualine.active then
  lvim.keys.normal_mode["]b"] = { "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" } }
  lvim.keys.normal_mode["[b"] = { "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" } }
else
  lvim.keys.normal_mode["]b"] = { vim.cmd.bnext, { desc = "Next Buffer" } }
  lvim.keys.normal_mode["[b"] = { vim.cmd.bprevious, { desc = "Previous Buffer" } }
end
lvim.keys.normal_mode["]B"] = { vim.cmd.blast, { desc = "Last Buffer" } }
lvim.keys.normal_mode["[B"] = { vim.cmd.bfirst, { desc = "First Buffer" } }

-- diff(change) or hunk
--    ]c   -- Jump forwards to the next start of a change.
--    [c   -- Jump backwards to the previous start of a change.
--    do (diff obtain) for :diffget (modify the current buffer to undo difference with another buffer)
--    dp (diff put) for :diffput (modify another buffer to undo difference with the current buffer)
-- ]c, [c for jump to diffs (builtin) or gitsigns
if lvim.builtin.gitsigns.active then
  lvim.keys.normal_mode["]c"] = {
    function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        local gs = require("gitsigns")
        gs.next_hunk({ navigation_message = false })
      end
    end,
    { desc = "Next Hunk/Change" },
  }
  lvim.keys.normal_mode["[c"] = {
    function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        local gs = require("gitsigns")
        gs.prev_hunk({ navigation_message = false })
      end
    end,
    { desc = "Previous Hunk/Change" },
  }

  -- Text object
  -- create ih ah with https://github.com/nvim-treesitter/nvim-treesitter-textobjects
end

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

lvim.keys.normal_mode["]d"] = { diagnostic_goto(true), { desc = "Next Diagnostic" } }
lvim.keys.normal_mode["[d"] = { diagnostic_goto(false), { desc = "Previous Diagnostic" } }
lvim.keys.normal_mode["]e"] = { diagnostic_goto(true, "ERROR"), { desc = "Next Error" } }
lvim.keys.normal_mode["[e"] = { diagnostic_goto(false, "ERROR"), { desc = "Previous Error" } }
lvim.keys.normal_mode["]w"] = { diagnostic_goto(true, "WARN"), { desc = "Next Warning" } }
lvim.keys.normal_mode["[w"] = { diagnostic_goto(false, "WARN"), { desc = "Prev Warning" } }

-- Tab-pages (p for tabPage)
-- use built-in gt/gT for :tabnext/tabprev or Ex-commands directly,
-- OR use (better) tmux to arrange workspaces
lvim.keys.normal_mode["]p"] = { vim.cmd.tabnext, { desc = "Next Tabpage" } }
lvim.keys.normal_mode["[p"] = { vim.cmd.tabprev, { desc = "Previous Tabpage" } }
lvim.keys.normal_mode["]P"] = { vim.cmd.tablast, { desc = "Last Tabpage" } }
lvim.keys.normal_mode["[P"] = { vim.cmd.tabfirst, { desc = "First Tabpage" } }

-- Quickfix and Loclist quickfix (or trouble.nvim)
lvim.keys.normal_mode["]q"] = {
  function()
    local status, t = pcall(require, "trouble")
    if status and t.is_open() then
      t.next({ skip_groups = true, jump = true })
    else
      vim.cmd.cnext()
    end
  end,
  { desc = "Next Trouble/Quickfix" },
}
lvim.keys.normal_mode["[q"] = {
  function()
    local status, t = pcall(require, "trouble")
    if status and t.is_open() then
      t.prev({ skip_groups = true, jump = true })
    else
      vim.cmd.cprevious()
    end
  end,
  { desc = "Previous Trouble/Quicfix" },
}
lvim.keys.normal_mode["]Q"] = {
  function()
    local status, t = pcall(require, "trouble")
    if status and t.is_open() then
      t.last({ skip_groups = true, jump = true })
    else
      vim.cmd.clast()
    end
  end,
  { desc = "Last Trouble/Quickfix" },
}
lvim.keys.normal_mode["[Q"] = {
  function()
    local status, t = pcall(require, "trouble")
    if status and t.is_open() then
      t.first({ skip_groups = true, jump = true })
    else
      vim.cmd.cfirst()
    end
  end,
  { desc = "First Trouble/Quickfix" },
}

lvim.keys.normal_mode["]l"] = { vim.cmd.lnext, { desc = "Next Loclist" } }
lvim.keys.normal_mode["[l"] = { vim.cmd.lprevious, { desc = "Previous Loclist" } }
lvim.keys.normal_mode["]L"] = { vim.cmd.llast, { desc = "Last Loclist" } }
lvim.keys.normal_mode["[L"] = { vim.cmd.lfirst, { desc = "First Loclist" } }

if lvim.builtin.illuminate.active then
  -- ]r, [r for jump to references
  lvim.keys.normal_mode["]r"] = {
    function()
      require("illuminate").goto_next_reference()
    end,
    { desc = "Next Reference" },
  }
  lvim.keys.normal_mode["[r"] = {
    function()
      require("illuminate").goto_prev_reference()
    end,
    { desc = "Previous Reference" },
  }
end

-- Tags
lvim.keys.normal_mode["]t"] = { vim.cmd.tnext, { desc = "Next Tag" } }
lvim.keys.normal_mode["[t"] = { vim.cmd.tprevious, { desc = "Previous Tag" } }
lvim.keys.normal_mode["]T"] = { vim.cmd.tlast, { desc = "Last Tag" } }
lvim.keys.normal_mode["[T"] = { vim.cmd.tfirst, { desc = "First Tag" } }

-- todo-comments ]-, [-
lvim.keys.normal_mode["]-"] = {
  function()
    local status, t = pcall(require, "todo-comments")
    if status then
      t.jump_next()
    end
  end,
  { desc = "Next Todo" },
}
lvim.keys.normal_mode["[-"] = {
  function()
    local status, t = pcall(require, "todo-comments")
    if status then
      t.jump_prev()
    end
  end,
  { desc = "Previous Todo" },
}

-- traversal through change list
--    g;  -- Go to [count] older position in change list.
--    g,  -- Go to [count] newer position in change list.

-- commenting (gco/gcO overrid by numToStr/Comment.nvim)
lvim.keys.normal_mode["gco"] = { "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Comment Below" } }
lvim.keys.normal_mode["gcO"] = { "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Comment Above" } }

-- better up/down
-- vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- better paste
-- lvim.keys.normal_mode["p"] = { '"+gP', { desc = "Repeatable Paste" } }
lvim.keys.visual_mode["p"] = { "P", { desc = "Paste" } }

-- Search and substitute

-- repeat search, n to always search forward and N backward whenever using / or ?
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
lvim.keys.normal_mode["n"] = { "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Match" } }
lvim.keys.visual_mode["n"] = { "'Nn'[v:searchforward]", { expr = true, desc = "Next Match" } }
lvim.keys.operator_pending_mode["n"] = { "'Nn'[v:searchforward]", { expr = true, desc = "Next Match" } }
lvim.keys.normal_mode["N"] = { "'nN'[v:searchforward].'zv'", { expr = true, desc = "Previous Match" } }
lvim.keys.visual_mode["N"] = { "'nN'[v:searchforward]", { expr = true, desc = "Previous Match" } }
lvim.keys.operator_pending_mode["N"] = { "'nN'[v:searchforward]", { expr = true, desc = "Previous Match" } }

-- search for the current 'selection' in Visual mode using * and #
-- similar to * and # for searching the 'word' under current cursor in Normal mode.
lvim.keys.visual_mode["*"] =
{ [[:lua vset_search()<cr>/<C-R>=@/<cr><cr>]], { silent = true, desc = "Search for Selection" } }
lvim.keys.visual_mode["#"] =
{ [[:lua vset_search()<cr>?<C-R>=@/<cr><cr>]], { silent = true, desc = "Search for Selection" } }

lvim.keys.normal_mode["&"] = { "<cmd>&&<cr>", { desc = "Last Substitute" } }
lvim.keys.visual_mode["&"] = { "<cmd>'<,'>&&<cr><Esc>", { desc = "Last Substitute" } }

if lvim.builtin.gitsigns.active then
  lvim.keys.visual_mode["ih"] = { ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" } }
  lvim.keys.operator_pending_mode["ih"] = { ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" } }
end


if lvim.builtin.dap.active then
  lvim.keys.normal_mode["<F9>"] = {
    function()
      require("dap").toggle_breakpoint()
    end,
    { desc = "Breakpoint" },
  }
  lvim.keys.normal_mode["<F5>"] = {
    function()
      require("dap").continue()
    end,
    { desc = "Start/Continue Debug" },
  }
  -- NOTE: Disable <S-F5> in iterm2 (setting -> profiles -> keys -> key mappings)
  -- TODO: <S-F5> doesn't work
  -- "<S-F5>",
  lvim.keys.normal_mode["<F4>"] = {
    function() require("dap").terminate() end,
    { desc = "Terminate Debug" } }
  lvim.keys.normal_mode["<C-S-F5>"] = {
    function() require("dap").run_last() end,
    { desc = "Run Last" } }
  lvim.keys.normal_mode["<F11>"] = {
    function() require("dap").step_into() end,
    { desc = "Step Into" } }
  lvim.keys.normal_mode["<S-F11>"] = {
    function() require("dap").step_out() end,
    { desc = "Step Out" } }
  lvim.keys.normal_mode["<F10>"] = {
    function() require("dap").step_over() end,
    { desc = "Step Over" } }
end

vim.cmd([[
cnoreabbrev <expr> grep getcmdtype() == ':' && getcmdline() =~# '^grep' ? 'silent grep' : 'grep'
cnoreabbrev <expr> lgrep getcmdtype() == ':' && getcmdline() =~# '^lgrep' ? 'silent lgrep' : 'lgrep'
]])

vim.cmd.iabbrev("adn and")
vim.cmd.iabbrev("waht what")
vim.cmd.iabbrev("@@ m.zhujiang@gmail.com")
vim.cmd.iabbrev("ccopy Copyright {...}, all rights reserved.")

-- vim.cmd.cnoreabbrev("<expr> make 'silent make <Bar> redraw!'")
-- rewrite grep command to run silently without press Enter to continue.
vim.cmd.cnoreabbrev("<expr> grep  (getcmdtype() ==# ':' && getcmdline() =~# '^grep')  ? 'silent grep': 'grep'")
vim.cmd.cnoreabbrev("<expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep' : 'lgrep'")

vim.cmd.cnoreabbrev("W! w!")
vim.cmd.cnoreabbrev("Q! q!")
vim.cmd.cnoreabbrev("Qall! qall!")
vim.cmd.cnoreabbrev("Wq wq")
vim.cmd.cnoreabbrev("Wa wa")
vim.cmd.cnoreabbrev("wQ wq")
vim.cmd.cnoreabbrev("WQ wq")

-- better lsp
-- -------------------------------------------------------------------------------------------
-- LSP Bindings
-- [ builtin bindings
-- lvim.lsp.buffer_mappings.normal_mode["K"] = { vim.lsp.buf.hover, "Show hover" }
-- lvim.lsp.buffer_mappings.normal_mode["gd"] = { vim.lsp.buf.definition, "Goto definition" }
-- lvim.lsp.buffer_mappings.normal_mode["gD"] = { vim.lsp.buf.declaration, "Goto Declaration" }
-- lvim.lsp.buffer_mappings.normal_mode["gr"] = { vim.lsp.buf.references, "Goto references" }
-- lvim.lsp.buffer_mappings.normal_mode["gI"] = { vim.lsp.buf.implementation, "Goto Implementation" }
-- lvim.lsp.buffer_mappings.normal_mode["gs"] = { vim.lsp.buf.signature_help, "Show signature_help" }
-- lvim.lsp.buffer_mappings.normal_mode["gl"] = { vim.diagnostic.open_float, "Show line diagnostics" }
-- ]

local version_not_010 = vim.fn.has("nvim-0.10") == 0
local version_not_011 = vim.fn.has("nvim-0.11") == 0
-- diagnostic
if version_not_010 then
  lvim.lsp.buffer_mappings.normal_mode["[d"] = { vim.diagnostic.goto_prev, "Previous Diagnostic" }
  lvim.lsp.buffer_mappings.normal_mode["]d"] = { vim.diagnostic.goto_next, "Next Diagnostic" }
  lvim.lsp.buffer_mappings.normal_mode["<C-W>d"] = { vim.diagnostic.open_float, "Diagnostic" }
end

-- Definition<C-]>, Declaration, Reference and Hover
lvim.lsp.buffer_mappings.normal_mode["gr"] = nil
lvim.lsp.buffer_mappings.normal_mode["gR"] = { vim.lsp.buf.references, "References(LSP)" }

lvim.lsp.buffer_mappings.normal_mode["grd"] = { vim.diagnostic.open_float, "Diagnostic(LSP)" }

lvim.lsp.buffer_mappings.normal_mode["grq"] = { vim.diagnostic.setqflist, "Diagnostic Quickfix(LSP)" }
lvim.lsp.buffer_mappings.normal_mode["grl"] = { vim.diagnostic.setloclist, "Diagnostic Loclist(LSP)" }

if version_not_011 then
  lvim.lsp.buffer_mappings.normal_mode["gO"] = { vim.lsp.buf.document_symbol, "Document_symbol(LSP)" }
  lvim.lsp.buffer_mappings.normal_mode["grr"] = { vim.lsp.buf.references, "References(LSP)" }
  lvim.lsp.buffer_mappings.normal_mode["gri"] = { vim.lsp.buf.implementation, "Implementation(LSP)" }

  -- Signature help, information about the parameters of your function/method in a floating window.
  lvim.lsp.buffer_mappings.insert_mode["<C-s>"] = { vim.lsp.buf.signature_help, "Signature_help(LSP)" }
end

-- Format
lvim.lsp.buffer_mappings.normal_mode["gQ"] = {
  function()
    local client_count = #vim.lsp.get_clients({ buffer = 0 })
    if client_count == 1 then
      -- if lsp server (including null-ls) support format, apply it.
      vim.lsp.buf.format({ async = true, bufnr = 0 })
    elseif client_count >= 2 then
      -- apply null-ls to format
      vim.lsp.buf.format({
        async = true,
        bufnr = 0,
        filter = function(c) -- apply null-ls client to apply format
          -- vim.print("gopls: autoformatting", c.id, c.name)
          return c.name == "null-ls"
        end,
      })
    end
  end,
  "Format(null-ls)",
}

-- refractor and Code actions
if version_not_011 then
  lvim.lsp.buffer_mappings.normal_mode["grn"] = { vim.lsp.buf.rename, "Rename(LSP)" }

  -- Code actions are available suggestions to fix errors and warnings.
  lvim.lsp.buffer_mappings.normal_mode["gra"] = { vim.lsp.buf.code_action, "Code Action(LSP)" }
  lvim.lsp.buffer_mappings.visual_mode["gra"] = { vim.lsp.buf.code_action, "Code Action(LSP)" }
end
-- TODO: setup codelens
lvim.lsp.buffer_mappings.normal_mode["grc"] = { vim.lsp.codelens.run, "CodeLens Action(LSP)" }

-- ----------------------------------------------------------------------------------------
-- Whichkey Bindings

lvim.builtin.which_key.mappings = {
  ["."] = { "<cmd>lcd %:p:h<cr>", "CWD" },
  [";"] = { "<cmd>Alpha<cr>", "Dashboard" },
  ["|"] = { vim.cmd.vsplit, "VSplit" },
  ["-"] = { vim.cmd.split, "Split" },

  a = {
    name = "Inspect/Audit",
    i = { vim.show_pos, "Inspect" },
    t = { vim.treesitter.inspect_tree, "InspectTree" },
  },
  b = {
    name = "+Buffer",
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
    d = { "<cmd>BufferLinePickClose<cr>", "Close" },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close Left" },
    l = { "<cmd>BufferLineCloseRight<cr>", "Close Right" },
    s = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by Directory" },
    S = { "<cmd>BufferLineSortByExtension<cr>", "Sort by Language" },
    p = { "<cmd>BufferLineTogglePin<cr>", "Pin" },
  },
  -- c for console/terminal ?

  B = { vim.cmd.make, "Make/Compile" },

  d = {
    name = "Debug",
    -- see also mapped <F-4> <F5> <F9> <F-10> <F-11>
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
    B = { "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ;))", "Breakpoint Condition" },

    s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    I = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    O = { "<cmd>lua require'dap'.step_back()<cr>", "Step(Go) Back" }, -- go back
    p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
    t = { "<cmd>lua require'dap'.close()<cr>", "Quit" },

    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
    w = { "<cmd>lua require('dap.ui.widgets').hover()<cr>", "Widgets" },

    u = { "<cmd>lua require'dapui'.toggle({})<cr>", "Toggle DapUI" },
    U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Reset DapUI" },
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Eval" },
    E = { "<cmd>lua require'dapui'.eval(vim.fn.input('[Expression] > '))<cr>", "Eval" },
  },
  e = { "<cmd>lua vim.api.nvim_feedkeys(':e ' .. vim.fn.expand('%:p:h') .. '/', 'n', true)<cr>", "Edit" },

  f = {
    name = "+Find",
    [":"] = { "<cmd>Telescope command_history<cr>", "Command History" },
    ["/"] = { "<cmd>Telescope search_history<cr>", "Command History" },
    ['"'] = { "<cmd>Telescope registers<cr>", "Registers" },
    ["'"] = { "<cmd>Telescope marks<cr>", "Marks" },
    ["-"] = { "<cmd>TodoTelescope<cr>", "Todo(Telescope)" },
    a = { "<cmd>Telescope autocommands<cr>", "Autocommands" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    -- lsp group - diagnostic
    d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Diagnostics(Document)" },
    D = { "<cmd>Telescope diagnostics<cr>", "Diagnostics(Workspace)" },
    -- 'e' for expression
    e = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    f = { "<cmd>Telescope find_files<cr>", "Files" },
    g = {
      name = "+Git",
      b = { "<cmd>Telescope git_branches<cr>", "Git Branches" },
      c = { "<cmd>Telescope git_commits<cr>", "Git Commits" },
      C = { "<cmd>Telescope git_bcommits<cr>", "Git Commits(Buffer)" },
      f = { "<cmd>Telescope git_files<cr>", "Git Files)" },
      s = { "<cmd>Telescope git_status<cr>", "Git Status" },
      S = { "<cmd>Telescope git_stash<cr>", "Git Stash" },
      g = { "<cmd>Telescope lazygit<cr>", "Git Repositories(LazyGit)" }
    },
    h = { "<cmd>Telescope help_tags<cr>", "Help Pages" },
    H = { "<cmd>Telescope highlights", "Highlight Groups" },
    j = { "<cmd>Telescope jumplist<cr>", "Jumplist" },
    k = { "<cmd>Telescope keymaps<cr>", "Keybindings" },
    -- lsp group
    l = {
      name = "+LSP",
      c = { "<cmd>Telescope lsp_incoming_calls<cr>", "Incoming Calls" },
      C = { "<cmd>Telescope lsp_outgoing_calls<cr>", "Outgoing Calls" },
      d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
      e = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
      i = { "<cmd>Telescope lsp_implementations<cr>", "Implementations" },
      r = { "<cmd>Telescope lsp_references<cr>", "References" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols(Document)" },
      S = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Symbols(Workspace)" },
      t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type Definitions" },
      w = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Symbols(Dynamic)" },
    },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    n = { "<CMD>Telescope notify<cr>", "Notifications" },
    o = { "<cmd>Telescope vim_options<cr>", "Vim Options" },
    p = { "<CMD>Telescope projects<cr>", "Projects" },
    q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
    Q = { "<cmd>Telescope loclist<cr>", "Loclist" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
    s = { "<cmd>Telescope spell_suggest<cr>", "Spell Suggestion" },
    -- For Intra-File Navigation: Yes, Tree-sitter can replace tags within a single file.
    -- Its real-time parsing is very useful for jumping to definitions, functions, or classes within a file.
    t = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
    -- { "<leader>ft",  builtin.current_buffer_tags,           desc = "Tags (buffer)" },
    -- Cross-file navigation: Use tags or a language server for fast, project-wide symbol indexing and jumping to definitions
    T = { "<cmd>Telescope tags<cr>", "Tags" },
    -- Searches for the string under your cursor or selection in your current working directory
    w = { "<cmd>Telescope grep_string<cr>", "Grep String" },

    x = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search" },
    z = { "<cmd>Telescope resume<cr>", "Last Find" },
    Z = { "<cmd>Telescope pickers<cr>", "Last Picker" },
  },

  g = {
    name = "+Git",
    g = { "<cmd>LazyGit<cr>", "LazyGit" },
    G = { "<cmd>LazyGitCurrentFile<cr>", "LazyGit(root)" },
    c = { "<cmd>LazyGitFilter<cr>", "LazyGit Commits" },
    C = { "<cmd>LazyGitFilterCurrentFile<cr>", "LazyGit Commits(Buffer)" },

    -- use Ex_cmd directly https://github.com/sindrets/diffview.nvim
    -- :DiffviewOpen [git rev] [options] [ -- {paths...}]
    -- :DiffviewClose
    -- :DiffviewToggleFiles
    -- :DiffviewFocusFiles
    -- :DiffviewRefresh
    -- :[range]DiffviewFileHistory [paths] [options]
    -- default keymaps: https://github.com/sindrets/diffview.nvim?tab=readme-ov-file#configuration
    -- TODO: toggle DiffviewOpen
    d = { "<cmd>DiffviewOpen<cr>", "DiffviewOpen" },
    h = { "<cmd>DiffviewFileHistory<cr>", "DiffviewFileHistory" },

    n = { "<cmd>Neogit<cr>", "Neogit" },
    u = {
      function()
        vim.cmd.nohlsearch()
        vim.cmd.diffupdate()
      end,
      "Diff Update",
    },
  },

  h = {
    name = "+Gitsigns",
    b = { "<cmd>Gitsigns blame_line<cr>", "Blame Line" },
    B = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Blame" },
    d = { "<cmd>Gitsigns diffthis<cr>", "Diff This" },
    D = { function() require("gitsigns").diffthis("~") end, "Diff This(~)" },
    -- for hidden (deleted content)
    h = { "<cmd>Gitsigns toggle_deleted<cr>", "Toggle Deleted/Hidden" },
    p = { "<cmd>Gitsigns preview_hunk<cr>", "Previous Hunk" },
    r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
    R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
    s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
    S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer" },
    u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },

    c = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle Signs" },
    n = { "<cmd>Gitsigns toggle_numhl<cr>", "Toggle Numhl" },
    l = { "<cmd>Gitsigns toggle_linehl<cr>", "Toggle Linehl" },
    w = { "<cmd>Gitsigns toggle_word_diff<cr>", "Toggle WordDiff" },
  },

  l = {
    name = "LSP",
    e = { vim.diagnostic.open_float, "Diagnostic(LSP)" },
    q = { vim.diagnostic.setqflist, "Diagnostic Quickfix(LSP)" },
    Q = { vim.diagnostic.setloclist, "Diagnostic Loclist(LSP)" },
    -- ]d/[d
    -- n = { vim.diagnostic.goto_next, "Next Diagnostic(LSP)" },
    -- p = { vim.diagnostic.goto_prev, "Previous Diagnostic(LSP)" },
    d = { vim.lsp.buf.definition, "Definition(LSP)" },
    D = { vim.lsp.buf.declaration, "Declaration(LSP)" },
    r = { vim.lsp.buf.references, "References(LSP)" },
    i = { vim.lsp.buf.implementation, "Implementation(LSP)" },
    s = { vim.lsp.buf.document_symbol, "Document_symbol(LSP)" },
    h = { vim.lsp.buf.signature_help, "Signature_help(LSP)" },

    a = { vim.lsp.buf.code_action, "Code Action(LSP)" },
    c = { vim.lsp.codelens.run, "CodeLens Action(LSP)" },
    n = { vim.lsp.buf.rename, "Rename(LSP)" },
    f = { vim.lsp.buf.format, "Format(LSP)" },
  },

  o = {
    name = "+Options",

    b = {
      function()
        vim.opt.background = vim.opt.background:get() == "dark" and "light" or "dark"
      end,
      "Background",
    },
    -- On/off
    c = {
      function()
        vim.opt.conceallevel = vim.opt.conceallevel:get() == 0 and 3 or 0
      end,
      "conceal",
    },
    d = {
      function()
        vim.diagnostic.enable(not vim.diagnostic.is_enabled())
      end,
      "Diagnostic",
    },
    h = {
      function()
        vim.lsp.inlay_hint(0, nil)
      end,
      "inlay_hints",
    },
    n = {
      function()
        local nb = vim.opt_local.number:get()
        vim.opt_local.number = not nb
        vim.opt_local.relativenumber = not nb
      end,
      "Numbers",
    },
    p = {
      function()
        vim.api.nvim_set_option_value("paste", not vim.opt_local.paste:get(), { scope = "local" })
      end,
      "Paste",
    },
    s = {
      function()
        vim.api.nvim_set_option_value("spell", not vim.opt_local.spell:get(), { scope = "local" })
      end,
      "Spelling",
    },
    t = {
      function()
        vim.b.ts_highlight = not vim.b.ts_highlight
        if vim.b.ts_highlight then
          vim.treesitter.start()
        else
          vim.treesitter.stop()
        end
      end,
      "Treesitter",
    },
    w = {
      function()
        vim.opt_local.wrap = not vim.opt_local.wrap:get()
      end,
      "Wrap",
    },
  },
  q = { vim.cmd.quit, "Quit" },
  Q = { vim.cmd.only, "Only" },
  s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search" },
  t = {
    name = "+Trouble/Test",
    -- h = { "<cmd>horizontal terminal<cr>", "Horizontal Terminal" },
    -- v = { "<cmd>vertical terminal<cr>", "Vertical Terminal" },

    d = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Document Diagnostics(Trouble)" },
    D = { "<cmd>Trouble diagnostics toggle<cr>", "Workspace Diagnostics(Trouble)" },
    l = { "<cmd>Trouble lsp toggle<cr>", "LSP(Trouble)" },
    r = { "<cmd>Trouble lsp_references toggle<cr>", "References(Trouble)" },
    q = { "<cmd>Trouble quickfix toggle<cr>", "Quickfix(Trouble)" },

    ["-"] = { "<cmd>TodoTrouble<cr>", "Todo(Trouble)" },

    f = {
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      "File(Test)",
    },
    F = {
      function()
        require("neotest").run.run(vim.loop.cwd())
      end,
      "All Files(Test)",
    },
    t = {
      function()
        require("neotest").run.run()
      end,
      "Run Test",
    },
    -- T for terminate
    T = {
      function()
        require("neotest").run.stop()
      end,
      "Stop Test",
    },
    a = {
      function()
        require("neotest").run.attach()
      end,
      "Attach to Test",
    },
    o = {
      function()
        require("neotest").output.open({ enter = true, auto_close = true })
      end,
      "Output(Test)",
    },
    O = {
      function()
        require("neotest").output_panel.toggle()
      end,
      "Output Panel(Test)",
    },
    s = {
      function()
        -- require("neotest").summary.toggle()
        require("neotest").summary.open({ enter = true, auto_close = true })
      end,
      "Summary(Test)",
    },
    -- i for identify or debug
    i = {
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      "Debug Test",
    },
  },

  -- remap <leader>v to <C-w>
  v = { "<c-w>", "+Window", { remap = true } },
  w = { vim.cmd.write, "Write" },
  W = { "<cmd>noautocmd w<cr>", "Save(No Formatting)" },
  x = { vim.cmd.bdelete, "Close" },
  X = { vim.cmd.bwipeout, "Wipeout" },

  z = {
    name = "+Info/Log",
    i = { "<cmd>LvimInfo<cr>", "Info(LunarVim)" },
    d = { "<cmd>LvimDocs<cr>", "Docs(LunarVim)" },
    f = {
      "<cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()<cr>",
      "Files(LunarVim)",
    },
    g = {
      "<cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()<cr>",
      "Grep(LunarVim)",
    },
    k = { "<cmd>Telescope keymaps<cr>", "Keymappings(LunarVim)" },
    u = { "<cmd>LvimUpdate<cr>", "Update(LunarVim)" },

    L = { "<cmd>LspInfo<cr>", "Info(LSP)" },
    n = { "<cmd>NullLsInfo<cr>", "Info(null_ls)" },
    m = { "<cmd>Mason<cr>", "Mason" },
    t = { "<cmd>TSConfigInfo<cr>", "Config Info(Treesitter)" },
    T = { "<cmd>TSInstallInfo<cr>", "Install Info(Treesitter)" },
    h = { "<cmd>checkhealth<cr>", "Health" },

    l = {
      name = "+Logs",
      c = {
        "<cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()<cr>",
        "Changelog(LunarVim)",
      },
      d = {
        "<cmd>lua vim.fn.execute('edit ' .. require('lvim.core.log').get_path())<cr>",
        "Log(LunarVim)",
      },
      n = { "<cmd>edit $NVIM_LOG_FILE<cr>", "Log(Neovim)" },
      l = { "<cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<cr>", "Log(LSP)" },
    },
    z = { "<cmd>Lazy <cr>", "Lazy" },
  },
}

lvim.builtin.which_key.vmappings = {
  h = {
    name = "+Gitsigns",
    r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
    s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
  },

  d = {
    name = "Debug",
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Eval" },
    E = { "<cmd>lua require'dapui'.eval(vim.fn.input('[Expression] > '))<cr>", "Eval" },
  },
  -- TODO: <leader>c instead
  l = {
    name = "+LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  },
}

-- User Commands
vim.api.nvim_create_user_command("SudoSave", "w !sudo tee % >/dev/null", { desc = "Sudo Save" })
vim.api.nvim_create_user_command("Qargs", function()
  vim.cmd("args " .. quickfix_filenames())
end, { desc = "Build Argument List with Quickfix" })
vim.api.nvim_create_user_command("CTagsGen", "!ctags -R --exclude=.git", { desc = "Run !ctags Command" })

-- Helper functions
function vset_search()
  -- Save the current contents of the 's' register
  local temp = vim.fn.getreg("s")

  -- Visually select the previously selected text and copy it to the 's' register
  vim.cmd('normal! gv"sy')

  -- Escape special characters and set the search register
  local search = vim.fn.escape(vim.fn.getreg("s"), "/\\")
  search = vim.fn.substitute(search, "\n", "\\n", "g")
  vim.fn.setreg("/", "\\V" .. search)

  -- Restore the original contents of the 's' register
  vim.fn.setreg("s", temp)
end

function quickfix_filenames()
  local buffer_numbers = {}
  for _, quickfix_item in ipairs(vim.fn.getqflist()) do
    buffer_numbers[quickfix_item.bufnr] = vim.fn.bufname(quickfix_item.bufnr)
  end
  return table.concat(vim.tbl_map(vim.fn.fnameescape, vim.tbl_values(buffer_numbers)))
end

-- TODO: loclist not test yet.
function toggle_qf_loc_list(list_type)
  if list_type == "quickfix" then
    if vim.fn.getqflist({ winid = 1 }).winid ~= 0 then
      vim.cmd.cclose()
    else
      vim.cmd.copen()
    end
  else
    if vim.fn.getloclist(0, { winid = 1 }).winid ~= 0 then
      vim.cmd.lclose()
    elseif not vim.tbl_isempty(vim.fn.getloclist(0)) then
      vim.cmd.lopen()
    end
  end
end

-- 6.Autocommands
-- To set up autocommands use the native nvim api vim.api.nvim_create_autocmd,
-- or use the helper Lunarvim table lvim.autocommands which will be passed to define_autocmds() automatically. (bad idea)

local function augroup(name)
  return vim.api.nvim_create_augroup("leovim_" .. name, { clear = true })
end

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local exclude = { "gitcommit" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      local win = vim.api.nvim_get_current_win()
      pcall(vim.api.nvim_win_set_cursor, win, mark)
    end
  end,
})

-- close some filetypes with <q>
-- NOTE: wonderful, register filetypes to quit with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "fugitive",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})


-- close_if_last_window: close all non-normal windows when the last normal window is closed
-- When using `:quit`, `:wq` or `:qall`, before deciding whether it closes the current window or quits Vim.
-- For `:wq` the buffer is written before QuitPre is triggered.
-- Can be used to close any non-essential window (quickfix, neo-tree, fugitive, spectre ...) if the current window is the last ordinary window.
vim.api.nvim_create_autocmd({ "QuitPre" }, {
  group = augroup("close_if_last_window"),
  callback = function()
    -- add more filetypes
    local non_essential_filetypes = {
      -- "help",
      "qf",
      "neo-tree",
      "spectre_panel",
      "fugitive",
      "toggleterm",
      "Trouble",
      "neotest-output-panel",
      "neotest-summary",
    }

    local win_id = vim.api.nvim_get_current_win()
    local tabid = vim.api.nvim_get_current_tabpage()
    local wins = vim.api.nvim_tabpage_list_wins(tabid)

    local is_essential_win = function(win)
      local buf = vim.api.nvim_win_get_buf(win)
      local ft = vim.api.nvim_buf_get_option(buf, "filetype")
      return not vim.tbl_contains(non_essential_filetypes, ft)
    end

    local essential_wins = vim.tbl_filter(is_essential_win, wins)
    local win_count = #essential_wins

    if (win_count == 1 and is_essential_win(win_id)) then
      -- close nonessential windows except current window which is closing
      for _, win in ipairs(wins) do
        if win ~= win_id then
          vim.api.nvim_win_close(win, true)
        end
      end
    end
  end,
})

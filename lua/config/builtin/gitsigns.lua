local gitsigns = require("gitsigns")
lvim.keys.normal_mode["]c"] = {
  function()
    if vim.wo.diff then
      vim.cmd("]c")
    else
      gitsigns.next_hunk({ navigation_message = false })
    end
  end,
  { desc = "Next Hunk/Change" },
}
lvim.keys.normal_mode["[c"] = {
  function()
    if vim.wo.diff then
      vim.cmd("[c")
    else
      gitsigns.prev_hunk({ navigation_message = false })
    end
  end,
  { desc = "Previous Hunk/Change" },
}

lvim.builtin.which_key.vmappings["g"] = {
  s = {
    function()
      require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end,
    "Stage hunk",
  },
  r = {
    function()
      require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end,
    "Reset hunk",
  },
}

-- Text object
vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "GitSigns Select Hunk" })

lvim.builtin.which_key.mappings["o"] = vim.tbl_extend("keep", lvim.builtin.which_key.mappings["o"], {
  D = {
    require("gitsigns").toggle_deleted,
    "Deleted(GitSigns)",
  },
  L = {
    require("gitsigns").toggle_current_line_blame,
    "Blameline(GitSigns)",
  },
})
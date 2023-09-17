lvim.builtin.terminal.size = function(term)
  if term.direction == "horizontal" then
    return vim.o.lines * 0.4
  elseif term.direction == "vertical" then
    return vim.o.columns * 0.4
  else
    return 0
  end
end
lvim.builtin.terminal.open_mapping = "<c-\\>"
lvim.builtin.terminal.execs = {}

-- mode = { "n", "i", "t" },
lvim.keys.normal_mode["<C-1>"] = {
  "<cmd>ToggleTerm direction=horizontal<cr>",
  { desc = "Terminal (horizontal)" },
}
lvim.keys.insert_mode["<C-1>"] = lvim.keys.normal_mode["<C-1>"]
lvim.keys.term_mode["<C-1>"] = lvim.keys.normal_mode["<C-1>"]
lvim.keys.normal_mode["<C-2>"] = {
  "<cmd>ToggleTerm direction=vertical<cr>",
  { desc = "Terminal (horizontal)" },
}
lvim.keys.insert_mode["<C-2>"] = lvim.keys.normal_mode["<C-2>"]
lvim.keys.term_mode["<C-2>"] = lvim.keys.normal_mode["<C-2>"]
lvim.keys.normal_mode["<C-3>"] = {
  "<cmd>ToggleTerm direction=float<cr>",
  { desc = "Terminal (float)" },
}
lvim.keys.insert_mode["<C-3>"] = lvim.keys.normal_mode["<C-3>"]
lvim.keys.term_mode["<C-3>"] = lvim.keys.normal_mode["<C-3>"]
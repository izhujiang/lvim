vim.list_extend(lvim.builtin.bufferline.options.offsets, {
  {
    filetype = "neo-tree",
    text = "Explorer",
    -- text_align = "left",
    -- separator = false,
    padding = 1,
  },
})

lvim.builtin.which_key.mappings["p"] = vim.tbl_extend("keep", lvim.builtin.which_key.mappings["p"], {
  b = { "<cmd>BufferLinePick<cr>", "Buffer" },
  B = { "<cmd>BufferLinePickClose<cr>", "Buffer(Close )" },
})
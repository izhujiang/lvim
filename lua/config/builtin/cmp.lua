local cmp = require("cmp")

lvim.builtin.cmp.preselect = cmp.PreselectMode.None -- disable lsp select item automatically, which enable cmp to select the first snip, and other sources as well
lvim.builtin.cmp.completion = {
  keyword_length = 1,
  completeopt = "menu,menuone,noinsert",
}

lvim.builtin.cmp.matching = {
  -- fuzzy_matching not friedly to ultisnips
  disallow_fuzzy_matching = true,
}

lvim.builtin.cmp.sources = cmp.config.sources(
  { -- group 1
    { name = "nvim_lsp", priority = 700, keyword_length = 1 },
    { name = "cmp_tabnine", priority = 900 },
    { name = "luasnip", priority_ = 500 },
    { name = "nvim_lua" },
  },
  { -- group 2
    { name = "buffer" },
    { name = "path" },
  },
  {
    { name = "nvim_lsp_signature_help", keyword_length = 1 },
  }
  -- { name = "copilot",                group_index = 1 },
  -- https://smarttech101.com/nvim-lsp-autocompletion-mapping-snippets-fuzzy-search/
  -- 📓 Note 1: The above settings make sure that buffer source is visible in the completion menu only when the nvim_lsp and ultisnips sources are not available.
  -- Similarly, nvim_lsp_signature_help will be visible only when the nvim_lsp, ultisnips, and buffer are not available. The same goes for source path.
  -- 📓 Note 2: Having nvim_lsp and ultisnips in a single bracket will allow them to be mixed in the listing otherwise, all the autocompletion menu’s place is taken over by nvim_lsp.
)

-- override mapping
-- lvim.builtin.cmp.mapping["<CR>"] = cmp.mapping.confirm({ select = true }, { "i", "c" }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

lvim.builtin.cmp.cmdline = {
  enable = true,
  options = {
    {
      sources = {
        { name = "path" },
        { name = "cmdline" },
      },
      type = ":",
    },
    {
      sources = {
        {
          name = "buffer",
        },
      },
      type = { "/", "?" },
    },
  },
}

lvim.builtin.cmp.filetype = {
  enable = true,
  type = "gitcommit",
  sources = {
    { name = "git" },
    { name = "buffer" },
  },
}
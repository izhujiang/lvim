return {
  -- Single tabpage interface for easily cycling through diffs for all modified
  -- files for any git rev.
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
    },
  },
  -- An interactive and powerful Git interface for Neovim
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    cmd = {
      "Neogit",
      "NeogitCommit",
      "NeogitLogCurrent",
      "NeogitResetState"
    },
    opts = {
      disable_context_highlighting = true,
      disable_signs = true,
      integrations = {
        telescope = true,
        diffview = true,
      }
    },
    config = true
  },

  -- Plugin for calling lazygit from within neovim.
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    init = function()
      vim.g.lazygit_floating_window_scaling_factor = 1

      vim.api.nvim_create_autocmd("BufReadPost", {
        group = vim.api.nvim_create_augroup("leovim_lazygit", { clear = true }),
        pattern = "*",
        callback = function()
          require('lazygit.utils').project_root_dir()
        end,
      })
    end,
    config = function()
      require("telescope").load_extension("lazygit")
    end
  },

  -- OR use :
  -- fugitive.vim: A Git wrapper so awesome, it should be illegal
  {
    "tpope/vim-fugitive",
    enabled = false,
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
  },
}
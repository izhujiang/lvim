return {
  -- A plugin for profiling Vim and Neovim startup time.
  -- usage
  -- :StartupTime
  -- Press K on events to get additional information.
  -- Press gf on sourcing events to load the corresponding file in a new split.
  -- :help startuptime-configuration for details on customization options.
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- library (async, job) used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },
}
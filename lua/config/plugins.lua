-- 3. Plugins
-- Plugins are managed by folke/lazy.nvim, and are split into core-plugins and user-plugins.
-- 3.1 Core plugins (lvim.builtin)
-- folke/lazy.nvim                              A modern plugin manager for Neovim
-- neovim/nvim-lspconfig	                      Quickstart configurations for the Nvim LSP client
-- tamago324/nlsp-settings.nvim	                A plugin for setting Neovim LSP with JSON or YAML files
-- jose-elias-alvarez/null-ls.nvim	            Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
-- williamboman/mason-lspconfig.nvim	          Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
-- williamboman/mason.nvim	                    Easily install and manage LSP servers, DAP servers, linters, and formatters
-- folke/tokyonight.nvim	                      A clean, dark Neovim theme
-- lunarvim/lunar.nvim	                        LunarVim Colorscheme
-- Tastyep/structlog.nvim	                      Structured Logging for nvim, using Lua
-- nvim-lua/popup.nvim	                        [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete
-- nvim-lua/plenary.nvim	                      plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
-- nvim-telescope/telescope-fzf-native.nvim	    FZF sorter for telescope written in c
-- hrsh7th/nvim-cmp	                            A completion plugin for neovim coded in Lua.
-- L3MON4D3/LuaSnip	                            Snippet Engine for Neovim written in Lua.
-- hrsh7th/cmp-nvim-lsp	                        nvim-cmp source for neovim builtin LSP client
-- saadparwaiz1/cmp_luasnip	                    luasnip completion source for nvim-cmp
-- hrsh7th/cmp-buffer	                          nvim-cmp source for buffer words
-- hrsh7th/cmp-path	                            nvim-cmp source for paths
-- folke/neodev.nvim	                          Dev setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
-- nvim-treesitter/nvim-treesitter              Nvim Treesitter configurations and abstraction layer
-- JoosepAlviste/nvim-ts-context-commentstring	Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.
-- b0o/schemastore.nvim	                        JSON schemas for Neovim
--
-- nvim-telescope/telescope.nvim	              Find, Filter, Preview, Pick. All lua, all the time.	optional
-- rafamadriz/friendly-snippets	                Set of preconfigured snippets for different languages.	optional
-- windwp/nvim-autopairs	                      autopairs for neovim written by lua	optional
-- kyazdani42/nvim-tree.lua	                    A file explorer tree for neovim written in lua	optional
-- tamago324/lir.nvim	                          Neovim file explorer	optional
-- lewis6991/gitsigns.nvim	                    Git integration for buffers	optional
-- folke/which-key.nvim	                        Displays a popup with possible keybindings of the command you started typing.	optional
-- numToStr/Comment.nvim	                      Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more	optional
-- ahmedkhalf/project.nvim	                    The superior project management solution for neovim	optional
-- nvim-tree/nvim-web-devicons	                lua fork of vim-web-devicons for neovim	optional
-- nvim-lualine/lualine.nvim	                  A blazing fast and easy to configure neovim statusline plugin written in pure lua	optional
-- SmiteshP/nvim-navic	                        winbar/statusline plugin that shows your current code context	optional
-- akinsho/bufferline.nvim	                    A snazzy bufferline for Neovim	optional
-- mfussenegger/nvim-dap	                      Debug Adapter Protocol client implementation for Neovim (>= 0.5)	optional
-- rcarriga/nvim-dap-ui	                        A UI for nvim-dap which provides a good out of the box configuration	optional
-- goolord/alpha-nvim	                          a lua powered greeter like vim-startify / dashboard-nvim	optional
-- akinsho/toggleterm.nvim	                    A neovim lua plugin to help easily manage multiple terminal windows	optional
-- RRethy/vim-illuminate	                      highlight word under the cursor using either LSP, Tree-sitter, or regex matching	optional
-- lunarvim/onedarker.nvim	                    Onedark inspired colorscheme written in lua.	optional
-- lukas-reineke/indent-blankline.nvim	        Indent guides for Neovim	optional

-- disable builtin plugins and keybindings
lvim.builtin.nvimtree.active = false
lvim.builtin.lir.active = false

require("config.builtin.treesitter")
require("config.builtin.telescope")
require("config.builtin.cmp")
require("config.builtin.bufferline")
require("config.builtin.illuminate")
require("config.builtin.toggleterm")
require("config.builtin.gitsigns")
require("config.builtin.dap")

-- 4.2 User plugins
-- More useful plugins: https://www.lunarvim.org/docs/configuration/plugins/example-configurations
lvim.plugins = require("plugins")
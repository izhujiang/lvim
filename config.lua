-- Configure LunarVim by using the configuration file located in ~/.config/lvim/config.lua.
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- To get the list of all available settings:
-- lvim --headless +'lua require("lvim.utils").generate_settings()' +qa && sort -o lv-settings.lua{,}

-- disable some builtin plugins (Ref: .local/share/lunarvim/lvim/lua/lvim/plugins.lua)
-- at the very beginning, keybindings and options dependen on whether the plugin is active or not.
lvim.builtin.lir.active = false
lvim.builtin.bigfile.active = false
lvim.builtin.comment.active = false

-- 1. Global variables and options
require("leovim.config.options")

-- 2. Keybindings and Commands
require("leovim.config.keybindings")

-- 3. Plugins
-- Plugins are managed by folke/lazy.nvim, and are split into core-plugins and user-plugins.
require("leovim.config.plugins")

-- 4. Appearance (colorscheme and statusline)
-- To switch color schemes on the fly, use <leader>sc (:Telescope colorscheme)
-- also press <leader>sp to cycle through colorschemes with a preview.
require("leovim.config.appearance")

-- 5. Language features
-- check information
-- :LvimInfo  -- Contains information about all the servers attached to the buffer you are editing and their current capabilities,
-- :LspInfo   -- Contains basic information about all the servers that are running.
-- :Mason     -- Contains information about all the servers that you can manage with mason
require("leovim.config.lsp")

-- 6.Autocommands
require("leovim.config.autocmds")

-- 7. FTPlugin (filetype plugin)
-- A filetype plugin is like a global plugin, except that it sets options and defines mappings for the current buffer only.
-- create a file at $LUNARVIM_CONFIG_DIR/after/ftplugin/c.lua
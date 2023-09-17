-- Configure LunarVim by using the configuration file located in ~/.config/lvim/config.lua.
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- To get the list of all available settings:
-- lvim --headless +'lua require("lvim.utils").generate_settings()' +qa && sort -o lv-settings.lua{,}

-- 1. Global variables options
require("config.options")

-- 2. Keybindings
-- If you want to (re)map a keybinding that starts with <leader>, use Whichkey Bindings.
-- If the bindings are LSP (intellisense) related, use LSP Bindings (buffer mapping).
-- In all other cases, use NeoVim mappings (global mapping)

-- Use <Leader>sk to view different keybinding currently set.
-- To see if a particular key has already been bound:
-- :verbose map <TAB>
-- :nmap for normal mode mappings
-- :vmap for visual mode mappings
-- :imap for insert mode mappings
-- :map for list every mapping
require("config.keymaps")

-- 3. Plugins
-- Plugins are managed by folke/lazy.nvim, and are split into core-plugins and user-plugins.
require("config.plugins")

-- 4. Appearance (colorscheme and statusline)
-- To switch color schemes on the fly, use <leader>sc (:Telescope colorscheme)
-- also press <leader>sp to cycle through colorschemes with a preview.
require("config.appearance")

-- 5. Language features
-- check information
-- :LvimInfo  -- Contains information about all the servers attached to the buffer you are editing and their current capabilities,
-- :LspInfo   -- Contains basic information about all the servers that are running.
-- :Mason     -- Contains information about all the servers that you can manage with mason

require("config.lsp")

-- 6.Autocommands
require("config.autocmds")

-- 7. FTPlugin (filetype plugin)
-- A filetype plugin is like a global plugin, except that it sets options and defines mappings for the current buffer only.
-- create a file at $LUNARVIM_CONFIG_DIR/after/ftplugin/c.lua
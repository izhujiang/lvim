-- 1. Global settings
-- 1.1 Neovim variables
-- vim.g.{name} -- global variables (g:)
-- vim.b.{name} -- variables for the current buffer (b:)
-- vim.w.{name} -- variables for thr current window (w:)
-- vim.t.{name} -- variables for the current tabpage (t:)
-- vim.v.{name} -- predefined Vim variables (v:)
-- vim.env.{name} -- environment variables defined in the editor session

lvim.debug = true
lvim.lazy.opts.defaults.lazy = true -- plugins load lazy by default, not at 'start'
lvim.leader = ","
lvim.localleader = "<Space>"

-- Running "git commit" in :terminal, reuse current nvim (via nvr),
-- avoid one nvim nested within another
vim.env.GIT_EDITOR = "nvr -cc split --remote-wait"

-- disable netrw at the very start of init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- 1.2 Neovim options
-- utilize treesitter to highlight and indent
vim.cmd("syntax off")
vim.cmd("filetype indent off")

vim.opt.autoindent = false
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.background = "dark"
vim.opt.backspace = { "eol", "start", "indent" }
-- vim.opt.backup = false -- creates a backup file
vim.opt.cindent = false                                                              -- Disable C-like indentation
vim.opt.clipboard = vim.env.SSH_TTY and ""
    or (vim.fn.has("unnamedplus") and { "unnamed", "unnamedplus" } or { "unnamed" }) -- sync with system clipboard
vim.opt.cmdheight = 3                                                                -- more space in the neovim command line for displaying messages
-- vim.opt.colorcolumn = ""
vim.opt.complete:append("i")
vim.opt.completeopt = { "menuone" } -- DON'T show up extra information in popup window, a bit distracting. DON'T use longest, which only insert the longest common text of the matches.
-- vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.conceallevel = 3            -- Hide * markup for bold and italic
vim.opt.confirm = true              -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true           -- highlight the current line
vim.opt.dictionary:prepend({ "/usr/share/dict/words" })
vim.opt.encoding = "utf-8"
vim.opt.fillchars = { horiz = "-", vert = "|", foldopen = "", foldclose = "", fold = "-", diff = "-", eob = "~" }

vim.opt.foldenable = false
vim.opt.foldmethod = "expr"                     -- "manual", "indent", "expr", "syntax", "diff", "marker",
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use Tree-sitter for folds
vim.opt.foldlevel = 99                          -- Start with all folds open
vim.opt.foldnestmax = 10

if vim.fn.executable("rg") then
  vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
  vim.opt.grepprg = "rg --column --line-number --no-heading --smart-case"
end
vim.opt.formatoptions = "jtcrqlnwmpa" -- TODO: how Vim formats text.
-- vim.opt.formatoptions = "jtcrqlnwmp"
-- 							default: tcqj,
-- 							o -- Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
-- 							a -- Automatic formatting of paragraphs.
-- 							r -- Automatically insert the current comment leader after hitting <Enter> in Insert mode.

-- vim.opt.helplang = "cn"
-- vim.opt.hidden = true
vim.opt.history = 2000
-- vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.infercase = true
-- vim.opt.inccommand = "nosplit" 							-- default: nosplit. split: preview incremental substitute
-- vim.opt.incsearch = true
vim.opt.iskeyword:append("-") -- treats words with `-` as single words
vim.opt.jumpoptions = "view"
vim.opt.laststatus = 3        -- 3, only the last window will always have a status line
vim.opt.lazyredraw = false
-- vim.opt.linebreak = true
-- vim.opt.list = true        -- Show some invisible characters (tabs...
vim.opt.listchars = { space = "_", tab = ">~" }
-- vim.opt.magic = true
-- vim.opt.modeline = true
vim.opt.mouse = "" -- disable mouse
vim.opt.nrformats:append({ "octal", "alpha" })
vim.opt.number = true
-- vim.opt.numberwidth = 4 -- minimal number of columns {default 4}
-- vim.opt.paste = false
vim.opt.path:append("**") -- set sub-directories for search (gf, :find) command
vim.opt.pumblend = 10     -- Popup blend, enables pseudo-transparency for the |popup-menu|.
vim.opt.pumheight = 10    -- Maximum number of entries in a popup
vim.opt.relativenumber = true
vim.opt.ruler = true      -- hide the line and column number of the cursor position
vim.opt.scrolloff = 8     -- minimal number of screen lines to keep above and below the cursor
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
-- vim.opt.shada="50,<1000,s100,:0,n~/nvim/shada"
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 2    -- the number of spaces inserted for each indentation
vim.opt.shortmess = "aT"
vim.opt.showcmd = false   -- hide (partial) command in the last line of the screen (for performance)
vim.opt.showmatch = true
vim.opt.showmode = false  -- Dont show mode since we have a statusline
vim.opt.showtabline = 0   -- Never show tabpages, use tmux instead tabpages

-- vim.opt.shell has been set if $SHELL exists during the process (step 1) of
-- initialization start
if vim.env.SHELL == "" then
  vim.opt.shell = "/bin/sh"
end

vim.opt.sidescrolloff = 8   -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.opt.signcolumn = "yes"  -- always show the sign column, otherwise it would shift the text each time
vim.opt.smartcase = true    -- Don't ignore case with capitals
vim.opt.smartindent = false -- make indenting smarter again, insert indents automatically
-- vim.opt.smarttab = true
-- vim.opt.spell = false
-- vim.opt.spelllang = { "en" }  -- default 'en'
vim.opt.spelloptions:append("noplainbuffer")
-- vim.opt.splitkeep = "screen"

-- vim.opt.splitbelow = true
-- vim.opt.splitright = true
vim.opt.statusline = "%F%m%r%h%w%=(%{&ff}/%Y)\\ (line\\ %l\\/%L,\\ col\\ %c)\\"
vim.opt.swapfile = false
vim.opt.switchbuf = "uselast,useopen"
vim.opt.tabstop = 2          -- Number of spaces tabs count for
vim.opt.termguicolors = true -- True color support, most terminals support feature
vim.opt.tildeop = true       -- tilde command "~" behaves like an operator.
-- vim.opt.timeout = true
vim.opt.timeoutlen = 700     -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.ttimeoutlen = 100    -- time waited for a key code or mapped key sequence to complete.
vim.opt.title = true
vim.opt.titlestring = "%F"
vim.opt.undofile = false                -- enable persistent undo
vim.opt.undolevels = 2000
vim.opt.updatetime = 10000              -- faster completion (4000ms default), idle time for swapfile being written to disk
-- vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.opt.whichwrap:append("<,>,[,],h,l") -- keys allowed to move to the previous/next line when the beginning/end of line is reached

vim.opt.wildignore:append({ "*.o", "*.obj", "*.rbc", "*.pyc", "__pycache__", "*.sqlite", "*.db" })
vim.opt.wildignore:append({ "*/tmp/*", "*.so", "*.swp", "*.zip" })
vim.opt.wildignore:append({ ".git/*", ".hg/*", ".svn/*", ".DS_Store" })
vim.opt.wildignorecase = true
vim.opt.wildmode = { "longest:full", "full" } -- Command-line completion mode
-- vim.opt.wildmode = "list:longest,list:full" -- Command-line completion mode
vim.opt.winminwidth = 5                       -- Minimum window width
vim.opt.wrap = false                          -- Minimum window width

local v = vim.opt

local has = vim.fn.has
local is_mac = has("macunix")
local is_win = has("win32")
local is_wsl = has("wsl")

if is_mac == 1 then
	v.clipboard:append({ "unnamedplus" })
end
if is_win == 1 then
	v.clipboard:prepend({ "unnamed", "unnamedplus" })
end

-- Settings #######################################################################################

-- Hide mode
v.showmode = false

-- Show (partial) command in the last line of the screen.
v.showcmd = true

-- Highlight the screen line of the cursor.
v.cursorline = true

-- Title of the window is 'titlestring' (if it is not empty), or: filename [ =-] (path) - VIM.
v.title = true

-- Name of title.
v.titlestring = ""

-- Enable syntax highlight.
v.syntax = "on"

-- Enable number line.
v.number = true

-- Enable relative line number.
v.relativenumber = true

-- Nvim emits true (24-bit) colours in the terminal, if 'termguicolors' is set.
v.termguicolors = true

-- Extra column, util for plugins.
v.signcolumn = "yes"

-- Number of screen lines to use for the command-line.
v.cmdheight = 1

-- Enable icons for Neovim.
vim.g.icons_enabled = true

-- Characters to fill the statuslines and vertical separators. Currently blank.
vim.o.fillchars = "eob: "

-- Characters to fill the statuslines and vertical separators. Currently blank.
vim.o.fillchars = "vert: " -- Char default: │
--
-- Suggestion menu to complete commands in cmd.
v.wildmenu = true

-- Backup ##########################################################################################

-- Disable backup file.
v.backup = false

-- Disable swapfile in all buffers.
v.swapfile = false

-- Make a backup before overwriting a file.
v.writebackup = false

-- Editor #########################################################################################

-- History of cmd commands.
v.history = 50

-- Levels of undo.
v.undolevels = 1000

-- Execution of automatic commands in ms.
v.updatetime = 500

-- Copy the structure of the existing lines indent when autoindenting a new line.
v.copyindent = true

--
v.autowrite = true

-- When a file have been changed outside of Vim, automatically read it again.
v.autoread = true

-- Incremental search on write command in cmd mode.
v.incsearch = true

-- Ignore case in search patterns with '/' or '?'.
v.ignorecase = true

-- Override the 'ignorecase' option if the search pattern contains upper case characters.
v.smartcase = true

-- Line break.
v.wrap = false

--
v.scrolloff = 5

--
v.completeopt = "menu,menuone,noselect"

-- Encoding #######################################################################################

-- File enconding.
v.encoding = "utf-8"

-- File encoding.
v.fileencoding = "utf-8"

-- File encoding.
vim.scriptencoding = "utf-8"

-- Term encoding.
vim.termeconfing = "utf-8"

-- Tab's ##########################################################################################

-- Automatic identation.
v.autoindent = true

-- On pressing tab, insert 4 spaces.
v.expandtab = true

-- Show existing tab with 4 spaces width.
v.tabstop = 4

-- Show existing tab with 4 spaces width.
v.softtabstop = 4

-- When indenting with '>', use 4 spaces width.
v.shiftwidth = 4

-- Tab with spaces.
v.backspace = "indent,eol,start"

-- Insert tabs on the start of a line according to shiftwidth.
v.smarttab = true

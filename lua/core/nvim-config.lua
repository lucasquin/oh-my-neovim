--###########
--# Autor ###############################################
--###########                                         ###
--# Website: lucasquin.dev                            ###
--# Github: https://github.com/lucasquin              ###
--# Linkedin: https://www.linkedin.com/in/lucasquin/  ###
--#######################################################
--
-- ##################
-- User Interface ######
-- ##################

-- Colorscheme.
--vim.cmd.colorscheme('darkblue') -- Doc: https://vimdoc.sourceforge.net/htmldoc/syntax.html#:colorscheme

-- If in Insert, Replace or Visual mode put a message on the last line.
vim.opt.showmode = true -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'showmode'

-- Show (partial) command in the last line of the screen.
vim.opt.showcmd = true -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'showcmd'

-- Highlight the screen line of the cursor.
vim.opt.cursorline = true -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'cursorline'

-- Title of the window is 'titlestring' (if it is not empty), or: filename [ =-] (path) - VIM.
vim.opt.title = true -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'title'

-- Name of title.
vim.opt.titlestring = '' -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'title'

-- Enable syntax highlight.
vim.opt.syntax = 'on' -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'syntax'

-- Enable number line.
vim.opt.number = true -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'number'

-- Enable relative line number.
vim.opt.relativenumber = true -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'relativenumber'

-- Nvim emits true (24-bit) colours in the terminal, if 'termguicolors' is set.
vim.opt.termguicolors = true -- Doc: https://neovim.io/doc/user/term.html

-- Extra column, util for plugins.
vim.opt.signcolumn = 'yes' -- Doc: https://neovim.io/doc/user/sign.html

-- Number of screen lines to use for the command-line.
vim.opt.cmdheight = 1 -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'cmdheight'

-- Enable icons for Neovim.
vim.g.icons_enabled = true

-- Characters to fill the statuslines and vertical separators. Currently blank.
vim.o.fillchars = 'eob: ' -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'fillchars'

-- Suggestion menu to complete commands in cmd.
vim.opt.wildmenu = true -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'wildmenu'

-- ##########
-- Backup ######
-- ##########

-- Disable backup file.
vim.opt.backup = false -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'backup'

-- Disable swapfile in all buffers.
vim.opt.swapfile = false -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'swapfile'

-- Make a backup before overwriting a file.
vim.opt.writebackup = false -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'writebackup'

-- ##########
-- Editor ######
-- ##########

-- History of cmd commands.
vim.opt.history = 50 -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'history'

-- Levels of undo.
vim.opt.undolevels = 1000 -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'undolevels'

-- Execution of automatic commands in ms.
vim.opt.updatetime = 250 -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'updatetime'

-- Copy the structure of the existing lines indent when autoindenting a new line.
vim.opt.copyindent = true -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'copyindent'

--
vim.opt.autowrite = true -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'autowrite'

-- When a file have been changed outside of Vim, automatically read it again.
vim.opt.autoread = true -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'autoread'

-- Incremental search on write command in cmd mode.
vim.opt.incsearch = true -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'incsearch'

-- Ignore case in search patterns with '/' or '?'.
vim.opt.ignorecase = true -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'ignorecase'

-- Override the 'ignorecase' option if the search pattern contains upper case characters.
vim.opt.smartcase = true -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'smartcase'

-- Line break.
vim.opt.wrap = false -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'wrap'

-- ############
-- Encoding ######
-- ############

-- File enconding.
vim.opt.encoding = 'utf-8' -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'encoding'

-- File encoding.
vim.opt.fileencoding = 'utf-8' -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'fileencoding'

-- File encoding.
vim.scriptencoding = 'utf-8' -- Doc: https://vimdoc.sourceforge.net/htmldoc/repeat.html#:scriptencoding

-- #########
-- Tab's ######
-- #########

-- Automatic identation.
vim.opt.autoindent = true -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'ai'

-- On pressing tab, insert 4 spaces.
vim.opt.expandtab = true -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'expandtab'

-- Show existing tab with 4 spaces width.
vim.opt.tabstop = 4 -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'tabstop'

-- Show existing tab with 4 spaces width.
vim.opt.softtabstop = 4 -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'softtabstop'

-- When indenting with '>', use 4 spaces width.
vim.opt.shiftwidth = 4 -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'shiftwidth'

-- Tab with spaces.
vim.opt.backspace = 'indent,eol,start' -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'backspace'

-- Insert tabs on the start of a line according to shiftwidth.
vim.opt.smarttab = true -- Doc: https://vimdoc.sourceforge.net/htmldoc/options.html#'smarttab'


-- Global set's ---------------------------------------------------------------------------------------------
vim.opt.autoread = true -- Update vim after file update from outsite
vim.opt.backspace = "indent,eol,start" -- Backspace default in insert mode
vim.opt.cmdheight = 2 -- Give more space for displaying messages
vim.opt.colorcolumn = "120" -- Draws a line at the given line to keep aware of the line size
vim.opt.filetype = "on" -- Detect and set the filetype option and trigger the FileType Event
vim.opt.hidden = true -- Hides the current buffer when a new file is openned
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.linebreak = false -- Wrap lines at convenient points
vim.opt.mouse = 'a' -- Enable mouse suport
vim.opt.number = true -- Enable line numbers
vim.opt.ruler = true -- Show cursor position in satus bar
vim.opt.scrolloff = 10 -- Minimum number of lines to keep above and below the cursor
vim.opt.showmode = false -- Hide current mode
vim.opt.signcolumn = "yes" -- Add a column on the left. Useful for linting
vim.opt.smartcase = true -- Consider case if there is a upper case character
vim.opt.smartindent = true -- Automatically inserts one extra level of indentation is some cases
vim.opt.syntax = "on" -- Enable syntax highlight
vim.opt.updatetime = 100 -- Time in miliseconds to consider the changes
vim.opt.wrap = false -- Don't wrap lines
-------------------------------------------------------------------------------------------------------------
--
--
--
-- Tab's ----------------------------------------------------------------------------------------------------
vim.opt.expandtab = true -- On pressing tab, insert 4 spaces
vim.opt.shiftwidth = 4 -- When indenting with ">", use 4 spaces width
vim.opt.smarttab = true -- Insert tab's on the start of a line according to shiftwidth
vim.opt.softtabstop = 4 -- Show existing tab with 4 spaces width
vim.opt.tabstop = 4 -- Show existing tab with 4 spaces width
-------------------------------------------------------------------------------------------------------------
--
--
--
-- Backup's -------------------------------------------------------------------------------------------------
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
-------------------------------------------------------------------------------------------------------------
--
--
--
-- Encoding -------------------------------------------------------------------------------------------------
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-------------------------------------------------------------------------------------------------------------
--
--
--
-- File search ----------------------------------------------------------------------------------------------
vim.opt.incsearch = true -- Incremental search
vim.opt.wildmenu = true -- Menu option in :find whith tab
vim.opt.path = vim.opt.path + "**" -- Set directory to the current file editing
-------------------------------------------------------------------------------------------------------------
--
--
--
-- Editor ---------------------------------------------------------------------------------------------------
vim.wo.relativenumber = true -- Show relative number
-------------------------------------------------------------------------------------------------------------

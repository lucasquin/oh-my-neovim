local opt = vim.opt

-- General.
opt.autoread = true -- Update vim after file update from outsite.
opt.backspace = "indent,eol,start" -- Backspace default in insert mode.
--opt.clipboard = 'unnamedplus' -- Copy/paste to system clipboard.
opt.filetype = "on" -- Detect and set the filetype option and trigger the FileType Event.
opt.mouse = 'a'-- Enable mouse suport.

-- Backup's
opt.backup = false
opt.swapfile = false
opt.writebackup = false

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
vim.scriptencoding = "utf-8"

-- Search
opt.incsearch = true -- Incremental search.
opt.path = vim.opt.path + "**" -- Set directory to the current file editing.
opt.wildmenu = true -- Menu option in :find whith tab.

-- Neovim UI
opt.cmdheight = 1 -- Give more space.
-- opt.colorcolumn = '100' -- Line lenght marker at 100 columns.
opt.ignorecase = true -- Ignore case in search.
opt.linebreak = false -- Wrap lines at convenient points.
opt.number = true -- Enable line numbers.
opt.ruler = true -- Show cursor position in satus bar.
opt.scrolloff = 20 -- Minimum number of lines to keep above and below the cursor.
opt.showmatch = true -- Highlight matching parenthesis.
opt.showmode = false -- Hide current mode.
opt.signcolumn = "yes" -- Add a column on the left. Useful for linting.
opt.smartcase = true -- Consider case if there is a upper case character.
opt.syntax = "on" -- Enable syntax highlight.
opt.termguicolors = true -- Enable 24-bit RGB colors.
opt.wrap = false -- Don't wrap lines.
vim.wo.relativenumber = true -- Line number in relative position.

-- Startup.
opt.shortmess:append "sI" -- Disable nvim intro.

-- Tabs, indent.
opt.expandtab = true -- On pressing tab, insert 4 spaces.
opt.shiftwidth = 4 -- When indenting with ">", use 4 spaces width.
opt.smartindent = true -- Automatically inserts one extra level of indentation is some cases.
opt.smarttab = true -- Insert tab's on the start of a line according to shiftwidth.
opt.tabstop = 4 -- Show existing tab with 4 spaces width.

-- Memory, CPU.
opt.hidden = true -- Hides the current buffer when a new file is openned.
opt.history = 100 -- Remember N lines in history.
opt.lazyredraw = true -- Faster scrolling.
opt.updatetime = 100 -- Time in miliseconds to wait for trigger an event.

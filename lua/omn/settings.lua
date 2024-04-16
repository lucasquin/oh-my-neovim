local o = vim.opt
local g = vim.g

-- Sets the leader key to the space bar. Leader key combinations are used to execute custom commands or mappings for efficiency.
g.mapleader = " "

-- No wrap lines
o.wrap = false

-- Replaces tab characters with spaces for consistent indentation.
o.expandtab = true

-- Specifies the number of spaces used for a single indentation level when shifting code with >> or <<.
o.shiftwidth = 2

-- Enables automatic indentation appropriate to the current filetype for better code readability.
o.smartindent = true

-- Sets the number of spaces a tab character represents when displayed.
o.tabstop = 2

-- Indicates the number of spaces to insert/remove when the tab or backspace key is pressed.
o.softtabstop = 2

-- Disables the startup message in Neovim.
o.shortmess:append "sI"

-- Uses spaces to visually mark the end of a buffer.
o.fillchars = { eob = " " }

-- Always show the status line at the bottom of the window.
o.laststatus = 3

-- Hides the Vim mode indicator (e.g., "-- INSERT --")
o.showmode = false

-- Enables access to the system clipboard for copying and pasting.
o.clipboard = "unnamedplus"

-- Highlights the current cursor line for visual clarity.
o.cursorline = false

-- Makes in-editor searches case-insensitive.
o.ignorecase = true

-- Makes searches case-sensitive if any uppercase letters are included in the search pattern.
o.smartcase = true

-- Enables mouse support in all modes.
o.mouse = "a"

-- Displays line numbers.
o.number = true

-- Sets the minimum number of columns used for displaying line numbers (good for alignment).
o.numberwidth = 2

-- Disables the ruler which shows the current column and line position.
o.ruler = false

-- Enables the sign column on the left to display signs (e.g., for Git changes and diagnostics).
o.signcolumn = "yes"

-- Opens new window splits below the current window.
o.splitbelow = true

-- Opens new window splits to the right of the current window.
o.splitright = true

-- Enables full color support (if the terminal supports it).
o.termguicolors = true

-- Sets the timeout for key combinations and mappings (in milliseconds).
o.timeoutlen = 400

-- Enables persistent undo history.
o.undofile = true

-- Specifies the milliseconds between writing changes to the swap file (also used by plugins like gitsigns).
o.updatetime = 250

-- Enables cursor movement to wrap to the previous/next line when reaching the beginning/end of a line. Includes h, l, and arrow keys.
o.whichwrap:append "<>[]hl"

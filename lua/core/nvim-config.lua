local g = vim.g

g.mapleader = '\\'
g.maplocalleader = '\\'

local v = vim.opt

-- Behaviour
v.showcmd = true
v.autowrite = true
v.autoread = true
v.history = 1000
v.undolevels = 1000
v.updatetime = 750

-- Backup
v.backup = false
v.swapfile = false
v.writebackup = false

-- Encondig
v.encoding = 'utf-8'
v.fileencoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- Search
v.incsearch = true
v.path = v.path + '**'
v.ignorecase = true
v.smartcase = true

-- Tabs and indenting
v.ai = true
v.tabstop = 4
v.softtabstop = 4
v.expandtab = false
v.shiftround = true
v.shiftwidth = 4
v.shiftround = true
v.backspace = 'indent,eol,start'
v.autoindent = true
v.copyindent = true
v.smarttab = true

-- UI
v.title = true
v.cmdheight = 1
v.wildmenu = true
v.showmode = false
v.signcolumn = 'yes'
v.syntax = 'on'
v.number = true
v.wrap = false
v.termguicolors = true
v.cursorline = true

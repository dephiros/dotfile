-- General
--- leader remap
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = " "
vim.g.maplocalleader = ","

--- autoreload buffer when running external command
vim.o.autoread = true

--- search highlight
vim.o.incsearch = true

--- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn="yes"

--- line number
vim.wo.number = true
vim.wo.relativenumber = true

--- indentation
vim.cmd([[

]])
--- auto indent the next line
vim.o.autoindent = true
vim.bo.autoindent = true
--- use tab for indentation and space for alignment
vim.o.smartindent = true
vim.bo.smartindent = true
--- number of column for tab display
vim.o.tabstop = 2
vim.bo.tabstop = 2
-- number of space using for autoindent
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
-- number of space using for space indent
vim.o.softtabstop = 2
vim.bo.softtabstop = 2

-- Initialize plugins
require("p/plugins")();


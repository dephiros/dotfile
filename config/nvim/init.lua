--- leader remap
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = " "
vim.g.maplocalleader = ","

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn="yes"

--- line number
vim.wo.number = true
vim.wo.relativenumber = true

--- indentation
vim.o.autoindent = true -- auto indent the next line
vim.o.smartindent = true -- use tab for indentation and space for alignment
vim.o.tabstop = 2 -- number of column for tab display
vim.o.shiftwidth = 2 -- number of space using for autoindent
vim.bo.shiftwidth = 2  -- have to set it so init.lua also have the same values
vim.o.softtabstop = 2 -- number of space using for space indent

-- Initialize plugins
require("p/plugins")();


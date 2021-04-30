function plugins()
	local execute = vim.api.nvim_command
	local fn = vim.fn

	local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

	if not pcall(require, 'packer') then
		print("* Cannot find packer. installing...")
		fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
		execute 'packadd packer.nvim'
		print("* packer installed")
	end

	vim.api.nvim_exec([[
		augroup Packer
			autocmd!
			autocmd BufWritePost lua/p/plugins.lua PackerCompile
		augroup end
	]], false)

	local use = require('packer').use
	require('packer').startup(function()
		use 'wbthomason/packer.nvim'       -- Package manager
		use 'tpope/vim-fugitive'           -- Git commands in nvim
		-- UI to select things (files, grep results, open buffers...)
		use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
		-- Theme inspired by Atom
		use {
			'joshdick/onedark.vim',
			config = function()
				vim.cmd[[colorscheme onedark]]
			end
		}
		use 'itchyny/lightline.vim'        -- Fancier statusline
		-- Add indentation guides even on blank lines
		use { 'lukas-reineke/indent-blankline.nvim', branch="lua" }
		-- Add git related info in the signs columns and popups
		use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
		use 'hrsh7th/nvim-compe'           -- Autocompletion plugin
		use {
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup {
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				}
			end
		}
	end)
end

return plugins

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
		-- Package manager
		use 'wbthomason/packer.nvim'
		-- language supports
		use 'sheerun/vim-polyglot'
		-- edit quote/paren/tag
		use 'tpope/vim-surround'
		-- helpful command :Delete :Move :Chmod :Sudo SudoEdit :Rename :Wall
		use 'tpope/vim-eunuch'
		-- add convenience on top of netrw for file navigation. '-' to go up, '~' to go home
		-- Remove info bar and hit I to reenable
		use 'tpope/vim-vinegar'
		-- Git commands in nvim
		use {
			'tpope/vim-fugitive',
			cmd={"Git", 'Gstatus', 'Gblame', 'Gpush', 'Gpull'},
			setup=require'p/fugitive'.setup
		}
		use {"editorconfig/editorconfig-vim"}
		-- UI to select things (files, grep results, open buffers...)
		use {
			'nvim-telescope/telescope.nvim',
			requires={{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
			cmd='Telescope',
			setup=require'p.telescope'.setup
		}
		-- Theme inspired by Atom
		use {
			'joshdick/onedark.vim',
			config=function()
				vim.cmd[[colorscheme onedark]]
			end
		}
		use {
			'glepnir/galaxyline.nvim',
			branch='main',
			-- some optional icons
			requires={'kyazdani42/nvim-web-devicons', opt = true}
		}
		-- Add indentation guides even on blank lines
		use { 'lukas-reineke/indent-blankline.nvim', branch="lua" }
		-- Add git related info in the signs columns and popups
		use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
		-- autocomplete from the guy who create vim-snip
		use {
			'hrsh7th/nvim-compe',
			setup = require("p/compe").setup,
			config = require("p/compe").config,
			event="InsertEnter *"
		}
		use {
			"folke/which-key.nvim",
			config=require("p/which-key").config
		}
		use {"mbbill/undotree", cmd={"UndotreeToggle"}}
		use {"neovim/nvim-lspconfig", config=require("p/lspconfig").config}
	end)
end

return plugins

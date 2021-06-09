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
		-- statusline
		use { 
			'itchyny/lightline.vim',
			setup=function()
				vim.g.lightline = {colorscheme="wombat"}
			end,
			config=function()
			end,
		}
		-- language supports
		use 'sheerun/vim-polyglot'
		-- svelte supports
		use 'evanleck/vim-svelte'
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
			cmd={"Git", "Gwrite", 'Gstatus', 'Gblame', 'Gpush', 'Gpull'},
			setup=require'p/fugitive'.setup
		}
		-- auto save vim session
		use 'tpope/vim-obsession'
		-- auto end certain structure like if/end
		use { 
			'airblade/vim-rooter',
			setup=function()
				vim.g.rooter_patterns = {'.git', 'Makefile'}
			end
		}
		use {
			'preservim/nerdcommenter',
			setup=require'p.nerdcommenter'.setup
		}
		use {"editorconfig/editorconfig-vim"}
		-- UI to select things (files, grep results, open buffers...)
		use {
			'nvim-telescope/telescope.nvim',
			requires={{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
			setup=require'p.telescope'.setup
		}
		-- Theme inspired by Atom
		use {
			'chriskempson/base16-vim',
			config=function()
				vim.cmd[[colorscheme base16-atelier-dune]]
			end
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
			'hrsh7th/vim-vsnip'
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

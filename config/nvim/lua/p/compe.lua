local utils = require('p/utils')

function setup()
	vim.g.loaded_compe_treesitter = true
	vim.g.loaded_compe_snippets_nvim = true
	vim.g.loaded_compe_spell = true
	vim.g.loaded_compe_tags = true
	vim.g.loaded_compe_ultisnips = true
	vim.g.loaded_compe_vim_lsc = true
	vim.g.loaded_compe_vim_lsp = true
end

function config() 
	require'compe'.setup {
		enabled = true,
		autocomplete = true,
		documentation = true,
		debug = false,
		min_length = 1,
		preselect = 'always',
		source = {path = true, buffer = true, nvim_lsp = true, nvim_lua = true, vsnip = false}
	}

	local opts = {noremap = true, silent = true, expr = true}
	utils.map('i', '<c-c>', [[compe#complete()]], opts)
	utils.map('i', '<cr>', [[compe#confirm('<cr>')]], opts)
	utils.map('i', '<c-e>', [[compe#close('<c-e>')]], opts)
end

return {config=config, setup=setup}

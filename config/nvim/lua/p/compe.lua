local utils = require('p/utils')

function setup()
	vim.g.loaded_compe_treesitter = true
	vim.g.loaded_compe_snippets_nvim = true
	vim.g.loaded_compe_spell = true
	vim.g.loaded_compe_tags = true
	vim.g.loaded_compe_ultisnips = true
	vim.g.loaded_compe_vim_lsc = true
	vim.g.loaded_compe_vim_lsp = true

	vim.cmd([[
		inoremap <silent><expr> <C-Space> compe#complete()
		inoremap <silent><expr> <CR>      compe#confirm('<CR>')
		inoremap <silent><expr> <C-e>     compe#close('<C-e>')
		inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
		inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
	]])


	-- use tab for autocomplete
	local t = function(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end

	local check_back_space = function()
		local col = vim.fn.col('.') - 1
		if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
			return true
		else
			return false
		end
	end

	-- Use (s-)tab to:
	--- move to prev/next item in completion menuone
	--- jump to prev/next snippet's placeholder
	_G.tab_complete = function()
		if vim.fn.pumvisible() == 1 then
			return t "<C-n>"
		elseif vim.fn.call("vsnip#available", {1}) == 1 then
			return t "<Plug>(vsnip-expand-or-jump)"
		elseif check_back_space() then
			return t "<Tab>"
		else
			return vim.fn['compe#complete']()
		end
	end
	_G.s_tab_complete = function()
		if vim.fn.pumvisible() == 1 then
			return t "<C-p>"
		elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
			return t "<Plug>(vsnip-jump-prev)"
		else
			return t "<S-Tab>"
		end
	end

	vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
	vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
	vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
	vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

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

end

return {config=config, setup=setup}

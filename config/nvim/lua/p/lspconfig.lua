function config() 
	-- Enable the following language servers
	local nvim_lsp = require('lspconfig')
	local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
	for _, lsp in ipairs(servers) do
		nvim_lsp[lsp].setup { on_attach = on_attach }
	end 
end

return {config=config}

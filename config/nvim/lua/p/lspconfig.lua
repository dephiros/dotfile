function config() 
	-- Enable the following language servers

	local utils = require('p/utils')

	--keymap
	utils.map("n", "<leader>ga", [[<cmd>lua vim.lsp.buf.code_action()<CR>]])
	
	local nvim_lsp = require('lspconfig')
	local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'svelte' }
	for _, lsp in ipairs(servers) do
		nvim_lsp[lsp].setup { on_attach = on_attach }
	end 

	vim.cmd([[ 
		" Show diagnostic popup on cursor hold
		autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
		nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
		nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
		" Code navigation shortcuts
		nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
		nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
		nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
		nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
		nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
		nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
		nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
		nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
		nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
	]])
end

return {config=config}

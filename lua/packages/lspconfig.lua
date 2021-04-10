local lspconfig = require('lspconfig')
local compe = require('compe')

compe.setup{
	preselect = 'always';
	
	source = {
		path = true;
		buffer = false;
		calc = false;
		nvim_lsp = true;
		nvim_lua = true;
		vsnip = false;
	};
}

_G.completion_complete = function()
    return vim.fn['compe#complete']()
end

_G.completion_confirm = function()
    return vim.fn['compe#confirm']('<CR>')
end

_G.completion_close = function()
    return vim.fn['compe#close']('<C-e>')
end

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { noremap = true, silent = true }
	local opts_expr = { expr = true }

    buf_set_keymap('i', '<C-SPACE>', 'v:lua.completion_complete()', opts_expr)
    buf_set_keymap('i', '<CR>', 'v:lua.completion_confirm()', opts_expr)
    buf_set_keymap('i', '<C-e>', 'v:lua.completion_close()', opts_expr)

	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

	if client.resolved_capabilities.document_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	elseif client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	end

--	if client.resolved_capabilities.document_highlight then
--    	vim.api.nvim_exec([[
--    		hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
--    	  	hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
--    	  	hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
--    	  	augroup lsp_document_highlight
--    	  	  autocmd! * <buffer>
--    	  	  autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--    	  	  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--    	  	augroup END
--    	]], false)
--	end
end

--lspconfig.clangd.setup{ on_attach = on_attach }
lspconfig.ccls.setup{ on_attach = on_attach }
lspconfig.pyright.setup{ on_attach = on_attach }
lspconfig.cmake.setup{ on_attach = on_attach }

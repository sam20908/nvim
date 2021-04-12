local lspconfig = require('lspconfig')
local compe = require('compe')
local lspkind = require('lspkind')
local saga = require('lspsaga')

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

lspkind.init({
	with_text = true,
	symbol_map = {
		Method = "  ",
	    Function = "  ",
	    Variable = "[]",
	    Field = "  ",
	    TypeParameter = "<>",
	    Constant = "  ",
	    Class = " פּ ",
	    Interface = " 蘒",
	    Struct = "  ",
	    Event = "  ",
	    Operator = "  ",
	    Module = "  ",
	    Property = "  ",
	    Enum = " 練",
	    Reference = "  ",
	    Keyword = "  ",
	    File = "  ",
	    Folder = " ﱮ ",
	    Color = "  ",
	    Unit = " 塞 ",
	    Snippet = "  ",
	    Text = "  ",
	    Constructor = "  ",
	    Value = "  ",
	    EnumMember = "  "
	 },
})

saga.init_lsp_saga()

vim.g.lexima_no_default_rules = true
vim.fn['lexima#set_default_rules']()

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.completion_complete = function()
    return vim.fn['compe#complete']()
end

_G.completion_confirm = function()
    return vim.fn['compe#confirm'](vim.fn['lexima#expand'](t '<LT>CR>', 'i'))
end

_G.completion_close = function()
    return vim.fn['compe#close']()
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
	buf_set_keymap('n', 'gv', '<Cmd>Lspsaga preview_definition<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
	--buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-s>', '<cmd>Lspsaga signature_help<CR>', opts)
	--buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>Lspsaga rename<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
	buf_set_keymap('n', '<space>t', '<cmd>Lspsaga code_action<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)

	buf_set_keymap('n', 'cbb', '<cmd>CclsBase<CR>', opts)
	buf_set_keymap('n', 'cbh', '<cmd>CclsBaseHierarchy<CR>', opts)
	buf_set_keymap('n', 'cdd', '<cmd>CclsDerived<CR>', opts)
	buf_set_keymap('n', 'cdh', '<cmd>CclsDerivedHierarchy<CR>', opts)
	buf_set_keymap('n', 'ccc', '<cmd>CclsCallers<CR>', opts)
	buf_set_keymap('n', 'cch', '<cmd>CclsCallHierarchy<CR>', opts)
    buf_set_keymap('n', 'cff', '<cmd>CclsCallees<CR>', opts)
	buf_set_keymap('n', 'cfh', '<cmd>CclsCalleeHierarchy<CR>', opts)
	buf_set_keymap('n', 'cmmm', '<cmd>CclsMembers<CR>', opts)
	buf_set_keymap('n', 'cmmh', '<cmd>CclsMemberHierarchy<CR>', opts)
	buf_set_keymap('n', 'cmff', '<cmd>CclsMemberFunctions<CR>', opts)
	buf_set_keymap('n', 'cmfh', '<cmd>CclsMemberFunctionHierarchy<CR>', opts)
	buf_set_keymap('n', 'cmtt', '<cmd>CclsMemberTypes<CR>', opts)
	buf_set_keymap('n', 'cmth', '<cmd>CclsMemberTypeHierarchy<CR>', opts)
	buf_set_keymap('n', 'cvv', '<cmd>CclsVars<CR>', opts)

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

vim.cmd [[highlight link CompeDocumentation NormalFloat]]

lspconfig.ccls.setup{ 
    on_attach = on_attach,
    init_options = {
        highlight = {
            lsRanges = true;
        }
    }
}
lspconfig.pyright.setup{ on_attach = on_attach }
lspconfig.cmake.setup{ on_attach = on_attach }

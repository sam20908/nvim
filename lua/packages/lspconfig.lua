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
		documentation = {
            border = "rounded",
            winhighlight = "CompeDocumentation",
            max_width = 120,
            min_width = 40,
            max_height = math.floor(vim.o.lines * 0.3),
            min_height = 1,
        };
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

_G.completion_confirm_no_alt_key = function()
    -- Used to allow completion with multiple cursors
    return vim.fn['compe#confirm']()
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
    buf_set_keymap('i', '<C-y>', 'v:lua.completion_confirm_no_alt_key()', opts_expr)
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

--lspconfig.ccls.setup{ 
    --on_attach = on_attach,
    --init_options = {
        --highlight = {
            --lsRanges = true;
        --}
    --}
--}
lspconfig.clangd.setup{ on_attach = on_attach }
lspconfig.pyright.setup{ on_attach = on_attach }
lspconfig.cmake.setup{ on_attach = on_attach }
lspconfig.gdscript.setup{ on_attach = on_attach }

--Disabled due to crashes
--local system_name
--if vim.fn.has("mac") == 1 then
    --system_name = "macOS"
--elseif vim.fn.has("unix") == 1 then
    --system_name = "Linux"
--elseif vim.fn.has('win32') == 1 then
    --system_name = "Windows"
--else
    --print("Unsupported system for sumneko")
--end

---- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
--local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
--local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

--lspconfig.sumneko_lua.setup {
    --cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    --on_attach = on_attach,
    --settings = {
        --Lua = {
            --runtime = {
                ---- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                --version = 'LuaJIT',
                ---- Setup your lua path
                --path = vim.split(package.path, ';'),
            --},
            --diagnostics = {
                ---- Get the language server to recognize the `vim` global
                --globals = {'vim'},
            --},
            --workspace = {
                ---- Make the server aware of Neovim runtime files
                --library = {
                    --[vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    --[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                --},
            --},
            ---- Do not send telemetry data containing a randomized but unique identifier
            --telemetry = {
                --enable = false,
            --},
        --},
    --},
--}

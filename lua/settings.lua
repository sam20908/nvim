vim.o.exrc = true
vim.o.secure = true

vim.o.swapfile = false
vim.o.backup = false
vim.bo.swapfile = false

vim.o.errorbells = false
vim.o.visualbell = false

vim.o.pastetoggle = '<F3>'

vim.o.termguicolors = true

vim.o.wrap = false
vim.o.hlsearch = false
vim.o.scrolloff = 8

vim.o.completeopt = 'menuone,noinsert,noselect'
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

vim.o.signcolumn = 'auto:[1-9]'

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

vim.o.copyindent = true
vim.o.preserveindent = true
vim.o.smartindent = true
vim.bo.copyindent = true
vim.bo.preserveindent = true
vim.bo.smartindent = true

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.clipboard = 'unnamedplus'

vim.o.updatetime = 100

vim.api.nvim_exec([[
    highlight link markdownError NONE
]], false)

-- Tracked by https://github.com/neovim/neovim/issues/13501
local local_vimrc = vim.fn.getcwd()..'/.nvimrc'
if vim.loop.fs_stat(local_vimrc) then
    vim.cmd('source '..local_vimrc)
end

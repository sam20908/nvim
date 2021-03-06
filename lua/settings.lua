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

vim.o.hidden = true

vim.o.cmdheight = 2

vim.o.completeopt = 'menuone,noselect'
vim.o.shortmess = vim.o.shortmess .. 'c'

--vim.o.signcolumn = 'auto:[1-9]' PROBLEMATIC LINE

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.clipboard = 'unnamedplus'

vim.o.updatetime = 100

local local_vimrc = vim.fn.getcwd()..'/.nvimrc'
if vim.loop.fs_stat(local_vimrc) then
    vim.cmd('source '..local_vimrc)
end

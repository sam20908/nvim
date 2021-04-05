api = require('api')

api.set_option('exrc', true)
api.set_option('secure', true)

api.set_buffer_option('swapfile', false)
api.set_option('backup', false)

api.set_option('errorbells', false)
api.set_option('visualbell', false)

api.set_option('pastetoggle', '<F3>')

api.set_option('wrap', false)
api.set_option('hlsearch', false)
api.set_option('scrolloff', 8)

api.set_option('completeopt', 'menuone,noinsert')

api.set_window_option('signcolumn', 'yes')

api.set_option('tabstop', 4)
api.set_option('shiftwidth', 4)
api.set_option('expandtab', true)

api.set_buffer_option('copyindent', true)
api.set_buffer_option('preserveindent', true)
api.set_buffer_option('smartindent', true)

api.set_window_option('number', true)
api.set_window_option('relativenumber', true)

api.set_option('clipboard', 'unnamedplus')

api.set_option('updatetime', 100)

api.set_option('signcolumn', 'auto:[1-9]')

vim.api.nvim_exec([[
    highlight link markdownError NONE
]], false)

-- Tracked by https://github.com/neovim/neovim/issues/13501
local local_vimrc = vim.fn.getcwd()..'/.nvimrc'
if vim.loop.fs_stat(local_vimrc) then
    vim.cmd('source '..local_vimrc)
end

api = require('api')

api.set_option('background', 'dark')

vim.cmd('colorscheme gruvbox8_hard')

local colorscheme = {}
colorscheme.colorscheme = 'gruvbox8'
api.set_var('lightline', colorscheme)

vim.api.nvim_set_option('background', 'dark')

vim.cmd('colorscheme gruvbox8_hard')

local colorscheme = {}
colorscheme.colorscheme = 'gruvbox8'

vim.api.nvim_set_var('lightline', colorscheme)

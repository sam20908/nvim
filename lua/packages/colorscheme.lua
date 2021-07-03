vim.api.nvim_set_option('background', 'dark')

vim.cmd('colorscheme gruvbox')

vim.api.nvim_set_var('airline_theme', 'base16_gruvbox_dark_hard')
vim.api.nvim_set_var('airline#extensions#tabline#enabled', 1)
vim.api.nvim_set_var('airline#extensions#fugitiveline#enabled', 1)
vim.api.nvim_set_var('airline#extensions#quickfix#enabled', 1)
vim.api.nvim_set_var('airline#extensions#bufferline#enabled', 1)
vim.api.nvim_set_var('airline#extensions#nvimlsp#enabled', 1)
vim.api.nvim_set_var('airline#extensions#whitespace#enabled', 0)

vim.api.nvim_set_var('airline#extensions#tabline#formatter', 'unique_tail_improved')

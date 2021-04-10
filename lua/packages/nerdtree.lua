local opts = { noremap = true, silent = true }

vim.g.NERDTreeMapMenu = 'q'

vim.api.nvim_set_keymap('n', '<LEADER>nf', '<CMD>NERDTreeFind<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>nt', '<CMD>NERDTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>nr', '<CMD>NERDTreeRefreshRoot<CR>', opts)

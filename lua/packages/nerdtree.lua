local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<LEADER>nn', '<CMD>NERDTreeFocus<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>nf', '<CMD>NERDTreeFind<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>nt', '<CMD>NERDTreeToggle<CR>', opts)

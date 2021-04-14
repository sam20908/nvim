local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<LEADER>nf', '<CMD>NvimTreeFindFile<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>nt', '<CMD>NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>nr', '<CMD>NvimTreeRefresh<CR>', opts)

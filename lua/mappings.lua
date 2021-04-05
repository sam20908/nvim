local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<LEADER>sv', '<CMD>vsplit<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>sh', '<CMD>split<CR>', opts)

vim.api.nvim_set_keymap('n', '<LEADER>bd', '<CMD>bdelete<CR>', opts)

vim.api.nvim_set_keymap('n', '<LEADER>qo', '<CMD>copen<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>qc', '<CMD>cclose<CR>', opts)

vim.api.nvim_set_keymap('n', '<LEADER>tc', '<CMD>tabclose<CR>', opts)
vim.api.nvim_set_keymap('n', '[r', '<CMD>tabnext<CR>', opts)
vim.api.nvim_set_keymap('n', ']r', '<CMD>tabprevious<CR>', opts)

vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', opts)
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', opts)
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', opts)
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', opts)

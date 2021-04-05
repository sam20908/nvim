local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<LEADER>gg', '<CMD>G<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>gc', '<CMD>Git commit<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>gp', '<CMD>Git push<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>gd', '<CMD>Gdiffsplit<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>gl', '<CMD>Glog<CR>', opts)

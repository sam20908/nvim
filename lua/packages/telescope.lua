local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<LEADER>ff', '<CMD>Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>fF', '<CMD>Telescope git_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>fb', '<CMD>Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>fg', '<CMD>Telescope live_grep<CR>', opts)

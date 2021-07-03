local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<LEADER>nf', '<CMD>NvimTreeFindFile<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>nt', '<CMD>NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>nr', '<CD>NvimTreeRefresh<CR>', opts)

vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_lsp_diagnostics = 0

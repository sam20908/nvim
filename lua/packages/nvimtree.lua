require'nvim-tree'.setup{}

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<LEADER>nf', '<CMD>NvimTreeFocus<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>nt', '<CMD>NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>nr', '<CMD>NvimTreeFindFile<CR>', opts)

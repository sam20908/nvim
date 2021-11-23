vim.g.neoformat_cpp_clangformat = { exe = 'clang-format' }

vim.g.neoformat_enabled_cpp = {'clangformat'}
vim.g.neoformat_enabled_c = {'clangformat'}

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<LEADER>tt', '<CMD>Neoformat<CR>', opts)

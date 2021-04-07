vim.g.cmake_vimspector_support = 1

local opts = { noremap = true, silent = true }
local opts_loud = { noremap = true }

vim.api.nvim_set_keymap('n', '<LEADER>pc', '<CMD>CMake<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>pb', '<CMD>CMakeBuild<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>pr', '<CMD>CMakeRun<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>pR', '<CMD>CMakeResetAndReload<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>pst', ':CMakeSelectTarget<SPACE>', opts_loud)
vim.api.nvim_set_keymap('n', '<LEADER>psb', ':CMakeSelectBuildType<SPACE>', opts_loud)

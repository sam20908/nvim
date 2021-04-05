api = require('api')

api.set_var('cmake_vimspector_support', 1)

local opts = { noremap = true, silent = true }
local opts_loud = { noremap = true }

api.set_keymap('n', '<LEADER>pc', '<CMD>CMake<CR>', opts)
api.set_keymap('n', '<LEADER>pb', '<CMD>CMakeBuild<CR>', opts)
api.set_keymap('n', '<LEADER>pr', '<CMD>CMakeRun<CR>', opts)
api.set_keymap('n', '<LEADER>pR', '<CMD>CMakeResetAndReload<CR>', opts)
api.set_keymap('n', '<LEADER>pst', ':CMakeSelectTarget<SPACE>', opts_loud)
api.set_keymap('n', '<LEADER>psb', ':CMakeSelectBuildType<SPACE>', opts_loud)

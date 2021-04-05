api = require('api')

local opts = { noremap = true, silent = true }

api.set_keymap('n', '<LEADER>ff', '<CMD>Telescope find_files<CR>', opts)
api.set_keymap('n', '<LEADER>fF', '<CMD>Telescope git_files<CR>', opts)
api.set_keymap('n', '<LEADER>fb', '<CMD>Telescope buffers<CR>', opts)
api.set_keymap('n', '<LEADER>fg', '<CMD>Telescope live_grep<CR>', opts)

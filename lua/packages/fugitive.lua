api = require('api')

local opts = { noremap = true, silent = true }

api.set_keymap('n', '<LEADER>gg', '<CMD>G<CR>', opts)
api.set_keymap('n', '<LEADER>gc', '<CMD>Git commit<CR>', opts)
api.set_keymap('n', '<LEADER>gp', '<CMD>Git push<CR>', opts)
api.set_keymap('n', '<LEADER>gd', '<CMD>Gdiffsplit<CR>', opts)
api.set_keymap('n', '<LEADER>gl', '<CMD>Glog<CR>', opts)

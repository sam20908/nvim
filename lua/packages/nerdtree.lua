api = require('api')

local opts = { noremap = true, silent = true }
api.set_keymap('n', '<LEADER>nn', '<CMD>NERDTreeFocus<CR>', opts)
api.set_keymap('n', '<LEADER>nf', '<CMD>NERDTreeFind<CR>', opts)
api.set_keymap('n', '<LEADER>nt', '<CMD>NERDTreeToggle<CR>', opts)

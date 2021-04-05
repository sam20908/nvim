api = require('api')

local opts = { noremap = true, silent = true }

-- Split panes
api.set_keymap('n', '<LEADER>sv', '<CMD>vsplit<CR>', opts)
api.set_keymap('n', '<LEADER>sh', '<CMD>split<CR>', opts)

-- Buffer control
api.set_keymap('n', '<LEADER>bd', '<CMD>bdelete<CR>', opts)

-- Quickfix shortcuts
api.set_keymap('n', '<LEADER>qo', '<CMD>copen<CR>', opts)
api.set_keymap('n', '<LEADER>qc', '<CMD>cclose<CR>', opts)

api = require('api')

local opts = { noremap = true, silent = true }

api.set_keymap('n', '<LEADER>sv', '<CMD>vsplit<CR>', opts)
api.set_keymap('n', '<LEADER>sh', '<CMD>split<CR>', opts)

api.set_keymap('n', '<LEADER>bd', '<CMD>bdelete<CR>', opts)

api.set_keymap('n', '<LEADER>qo', '<CMD>copen<CR>', opts)
api.set_keymap('n', '<LEADER>qc', '<CMD>cclose<CR>', opts)

api.set_keymap('n', '<LEADER>tc', '<CMD>tabclose<CR>', opts)
api.set_keymap('n', '[r', '<CMD>tabnext<CR>', opts)
api.set_keymap('n', ']r', '<CMD>tabprevious<CR>', opts)

api = require('api')

api.set_var('vimspector_enable_mappings', 'VISUAL_STUDIO')

local opts = { noremap = true, silent = true }
local opts_loud = { silent = true }

api.set_keymap('n', '<LEADER>vr', '<CMD>VimspectorReset<CR>', opts)
api.set_keymap('n', '<LEADER>vi', '<PLUG>VimspectorBalloonEval', opts_loud)
api.set_keymap('x', '<LEADER>vi', '<PLUG>VimspectorBalloonEval', opts_loud)

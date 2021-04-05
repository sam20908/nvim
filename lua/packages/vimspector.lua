api = require('api')

api.set_var('vimspector_enable_mappings', 'VISUAL_STUDIO')

local opts = { silent = true }

api.set_keymap('n', '<LEADER>vi', '<PLUG>VimspectorBalloonEval', opts)
api.set_keymap('x', '<LEADER>vi', '<PLUG>VimspectorBalloonEval', opts)

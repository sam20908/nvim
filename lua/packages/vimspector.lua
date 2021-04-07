vim.g.vimspector_enable_mappings = 'VISUAL_STUDIO'

local opts = { noremap = true, silent = true }
local opts_loud = { silent = true }

vim.api.nvim_set_keymap('n', '<LEADER>vr', '<CMD>VimspectorReset<CR>', opts)
vim.api.nvim_set_keymap('n', '<LEADER>vi', '<PLUG>VimspectorBalloonEval', opts_loud)
vim.api.nvim_set_keymap('x', '<LEADER>vi', '<PLUG>VimspectorBalloonEval', opts_loud)

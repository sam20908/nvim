local api = {}

function api.set_option(...)
    vim.api.nvim_set_option(...)
end

function api.set_window_option(...)
    vim.api.nvim_win_set_option(0, ...)
end

function api.set_buffer_option(...)
    vim.api.nvim_buf_set_option(0, ...)
end

function api.set_var(...)
    vim.api.nvim_set_var(...)
end

function api.set_var(...)
    vim.api.nvim_set_var(...)
end

function api.set_keymap(...)
    vim.api.nvim_set_keymap(...)
end

return api

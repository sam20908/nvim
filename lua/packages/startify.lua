local function get_file_name(filepath)
    return string.match(filepath, "^.+/(.+)$")
end

local function get_file_ext(filepath)
    -- We need to remove the dot in the extension
    return string.sub(string.match(filepath, "^.+(%..+)$"), 2)
end

_G.get_icon = function(filepath)
    local devicons = require('nvim-web-devicons')
    if not devicons.has_loaded() then
        devicons.setup()
    end

    local filename = get_file_name(filepath)
    local file_ext = get_file_ext(filepath)

    return devicons.get_icon(filename, file_ext, { default = true })

end

vim.cmd [[
    function! StartifyEntryFormat()
        return 'v:lua.get_icon(absolute_path) ." ". entry_path'
    endfunction
]]
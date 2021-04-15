local gl = require('galaxyline')
local fileinfo = require('galaxyline.provider_fileinfo')
local condition = require('galaxyline.condition')
local gls = gl.section

local theme = require('galaxyline.theme').default

local my_colors = {
    black = '#000000',
    white = '#FFFFFF'
}

local function wrap_in_spaces(str)
    return ' ' .. str .. ' '
end

gls.left[1] = {
    ViMode = {
        provider = function()
            local alias = {
                n = 'NORMAL',
                i = 'INSERT',
                c= 'COMMAND',
                v= 'VISUAL',
                V= 'VISUAL LINE',
                [''] = 'VISUAL BLOCK'
            }

            -- Having to add extra space to the left to avoid unaligned wrapping spaces
            return ' ' .. wrap_in_spaces(alias[vim.fn.mode()])
        end,
        separator = ' ',
        highlight = { my_colors.black, theme.green },
        separator_highlight = { theme.bg, theme.bg }
    }
}

gls.left[2] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        highlight = { fileinfo.get_file_icon_color, theme.bg  }
    }
}

gls.left[3] = {
    FileName = {
        provider = 'FileName',
        condition = condition.buffer_not_empty,
        highlight = { my_colors.white, theme.bg }
    }
}

gls.left[4] = {
    LinePercent = {
        provider = function()
            local percent = fileinfo.current_line_percent()

            if string.match(percent, 'Top') then
                return '0%'
            elseif string.match(percent, 'Bot') then
                return '100%'
            else
                return percent
            end
        end,
        condition = condition.buffer_not_empty,
        highlight = { my_colors.white, theme.bg }
    }
}

gls.right[1] = {
    FileEncode = {
        provider = 'FileEncode',
        condition = condition.buffer_not_empty,
        highlight = { my_colors.white, theme.bg }
    }
}

gls.right[2] = {
    FileFormat = {
        provider = function()
            return wrap_in_spaces(fileinfo.get_file_format())
        end,
        condition = condition.buffer_not_empty,
        separator = ' ',
        highlight = { my_colors.black, theme.green },
        separator_highlight = { theme.bg, theme.bg }
    }
}

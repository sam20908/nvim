local gl = require('galaxyline')
local fileinfo = require('galaxyline.provider_fileinfo')
local condition = require('galaxyline.condition')
local vcs = require('galaxyline.provider_vcs')
local diagnostic = require('galaxyline.provider_diagnostic')
local lspclient = require('galaxyline.provider_lsp')
local gls = gl.section

local theme = require('galaxyline.theme').default

local my_colors = {
    black = '#000000',
    white = '#FFFFFF',
    grey = '#403e37'
}

local function wrap_in_spaces(str)
    return string.format(' %s ', str)
end

gls.left[1] = {
    ViMode = {
        provider = function()
            local alias = {
                n = 'NORMAL',
                i = 'INSERT',
                c = 'COMMAND',
                v = 'VISUAL',
                V = 'VISUAL LINE',
                [''] = 'VISUAL BLOCK'
            }

            local mode_color = {
                n = theme.green,
                i = theme.cyan,
                c = theme.magenta,
                v = theme.violet,
                V = theme.violet,
                [''] = theme.violet
            }

            vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color[vim.fn.mode()])

            -- Having to add extra space to the left to avoid unaligned wrapping spaces
            return ' ' .. wrap_in_spaces(alias[vim.fn.mode()])
        end,
        separator = ' ',
        highlight = { my_colors.black, theme.green },
        separator_highlight = { theme.bg, my_colors.grey }
    }
}

gls.left[2] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        highlight = { fileinfo.get_file_icon_color, my_colors.grey }
    }
}

gls.left[3] = {
    FileName = {
        provider = 'FileName',
        condition = condition.buffer_not_empty,
        highlight = { my_colors.white, my_colors.grey }
    }
}

gls.left[4] = {
    LinePercent = {
        provider = function()
            local percent = fileinfo.current_line_percent()

            if string.match(percent, 'Top') then
                return '0% '
            elseif string.match(percent, 'Bot') then
                return '100% '
            else
                return percent
            end
        end,
        separator = ' ',
        condition = condition.buffer_not_empty,
        highlight = { my_colors.white, my_colors.grey },
        separator_highlight = { theme.bg, theme.bg }
    }
}

gls.left[5] = {
    Diagnostics = {
        provider = function()
            local errors = diagnostic.get_diagnostic_error()
            local warns = diagnostic.get_diagnostic_warn()
            local hints = diagnostic.get_diagnostic_hint()
            local infos = diagnostic.get_diagnostic_info()

            errors = errors and errors or '0'
            warns = warns and warns or '0'
            hints = hints and hints or '0'
            infos = infos and infos or '0'

            return string.format('❌: %s 🟡: %s ❕: %s ❔: %s', errors, warns, hints, infos)
        end,
        condition = function()
            -- This only triggers on new buffers when saved
            return not string.match(lspclient.get_lsp_client(), 'No Active Lsp')
        end,
        highlight = { my_colors.white, theme.bg }
    }
}

gls.right[3] = {
    FileEncode = {
        provider = function()
            return wrap_in_spaces(fileinfo.get_file_encode())
        end,
        condition = condition.buffer_not_empty,
        highlight = { my_colors.black, theme.green }
    }
}

gls.right[2] = {
    FileFormat = {
        provider = function()
            return wrap_in_spaces(fileinfo.get_file_format())
        end,
        condition = condition.buffer_not_empty,
        separator = ' ',
        highlight = { my_colors.white, my_colors.grey },
        separator_highlight = { theme.bg, theme.bg }
    }
}

gls.right[1] = {
    VCS = {
        provider = function()
            local branch = vcs.get_git_branch()
            local adds = vcs.diff_add()
            local modifies = vcs.diff_modified()
            local removes = vcs.diff_remove()

            adds = adds and adds or 0
            modifies = modifies and modifies or 0
            removes = removes and removes or 0

            return string.format('🌲 %s +%d ±%d -%d', branch, adds, modifies, removes)
        end,
        condition = function()
            return condition.check_git_workspace and vcs.get_git_branch()
        end,
        highlight = { my_colors.white, theme.bg }
    }
}

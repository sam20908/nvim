local gl = require('galaxyline')
local fileinfo = require('galaxyline.provider_fileinfo')
local condition = require('galaxyline.condition')
local vcs = require('galaxyline.provider_vcs')
local diagnostic = require('galaxyline.provider_diagnostic')
local gls = gl.section

local theme = require('galaxyline.theme').default

local my_colors = {
    black = '#000000',
    white = '#FFFFFF',
    grey = '#403e37'
}

local function buf_has_lsp()
    return not vim.tbl_isempty(vim.lsp.buf_get_clients(0))
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

            return string.format('  %s ', alias[vim.fn.mode()])
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
        highlight = { fileinfo.get_file_icon_color, theme.bg }
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
                return '0% '
            elseif string.match(percent, 'Bot') then
                return '100% '
            else
                return percent
            end
        end,
        condition = condition.buffer_not_empty,
        highlight = { my_colors.white, theme.bg }
    }
}

gls.left[5] = {
    Errors = {
        provider = function()
            if not buf_has_lsp() then
                return ''
            end

            local errors = diagnostic.get_diagnostic_error()

            if not errors then
                return ''
            else
                return string.format('  E:%s', errors)
            end
        end, 
        highlight = { my_colors.black, theme.red }
    }
}

gls.left[6] = {
    Warnings = {
        provider = function()
            if not buf_has_lsp() then
                return ''
            end

            local warns = diagnostic.get_diagnostic_warn()

            if not warns then
                return ''
            else
                return string.format('  W:%s', warns)
            end
        end, 
        highlight = { my_colors.black, theme.orange }
    }
}

gls.left[7] = {
    Hints = {
        provider = function()
            if not buf_has_lsp() then
                return ''
            end

            local hints = diagnostic.get_diagnostic_hint()

            if not hints then
                return ''
            else
                return string.format('  H:%s', hints)
            end
        end, 
        highlight = { my_colors.black, theme.yellow }
    }
}

gls.left[8] = {
    Infos = {
        provider = function()
            if not buf_has_lsp() then
                return ''
            end

            local infos = diagnostic.get_diagnostic_info()

            if not infos then
                return ''
            else
                return string.format('  I:%s', infos)
            end
        end, 
        highlight = { my_colors.black, my_colors.white }
    }
}

gls.left[9] = {
    Separator = {
        provider = function()
            return ''
        end,
        highlight = { theme.bg, theme.bg }
    }
}

gls.right[3] = {
    FileEncode = {
        provider = function()
            return string.format(' %s ', fileinfo.get_file_encode())
        end,
        condition = condition.buffer_not_empty,
        highlight = { my_colors.black, theme.green }
    }
}

gls.right[2] = {
    FileFormat = {
        provider = function()
            return string.format(' %s ', fileinfo.get_file_format())
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

local builtin = require("el.builtin")
local extensions = require("el.extensions")
local subscribe = require("el.subscribe")
local lsp_statusline = require("el.plugins.lsp_status")

local sections = require("el.sections")
local helper = require("el.helper")
local diagnostic = require("el.diagnostic")

local has_lsp_extensions, ws_diagnostics = pcall(require, "lsp_extensions.workspace.diagnostic")

local file_icon = subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, bufnr)
    local icon = extensions.file_icon(_, bufnr)

    if icon then
        return icon .. " "
    end

    return ""
end)

local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
    local branch = extensions.git_branch(window, buffer)

    if branch then
        return " " .. extensions.git_icon(window, buffer) .. " " .. branch
    end
end
)

local git_changes = subscribe.buf_autocmd("el_git_changes", "BufWritePost", function(window, buffer)
    return extensions.git_changes(window, buffer)
end)

local ws_diagnostic_counts = function(_, buffer)
    if not has_lsp_extensions then
        return ""
    end

    local messages = {}

    local error_count = ws_diagnostics.get_count(buffer.bufnr, "Error")

    local x = "⬤"
    if error_count == 0 then
        -- pass
    elseif error_count < 5 then
        table.insert(messages, string.format("%s#%s#%s%%*", "%", "StatuslineError" .. error_count, x))
    else
        table.insert(messages, string.format("%s#%s#%s%%*", "%", "StatuslineError5", x))
    end

    return table.concat(messages, "")
end

local show_current_func = function(window, buffer)
    if buffer.filetype == "lua" then
        return ""
    end

    return lsp_statusline.current_function(window, buffer)
end

local diagnostic_display = diagnostic.make_buffer()

require("el").setup({
    generator = function(window, buffer)
        local mode = extensions.gen_mode({ format_string = " %s " })

        local items = {
            { mode, },
            { git_branch },
            { " " },
            { sections.split, },
            { file_icon },
            { sections.maximum_width(builtin.file_relative, 0.50), },
            { sections.collapse_builtin({ { " " }, { builtin.modified_flag } }) },
            { sections.split, },
            { diagnostic_display },
            { show_current_func },
            { git_changes },
            { "[" },
            { builtin.percentage_through_window },
            { "]" },
            {
                sections.collapse_builtin {
                    "[",
                    builtin.help_list,
                    builtin.readonly_list,
                    "]",
                },
            },
            { builtin.filetype },
        }


        local result = {}

        for _, item in ipairs(items) do
            table.insert(result, item)
        end

        return result
    end
})

require("fidget").setup { }

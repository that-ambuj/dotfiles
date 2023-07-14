vim.g.startify_bookmarks = {
    "~/dotfiles/nvim",
    "~/.zshrc",
    "~/.config/kitty/kitty.conf",
    "~/.config/alacritty/alacritty.yml",
    "~/.config/i3/config",
}

-- vim.g.startify_session_dir = os.getenv("HOME") .. "/.vim/startify"

vim.g.starify_files_number = 5
vim.g.startify_padding_left = 4
vim.g.startify_change_to_vcs_root = true

vim.g.startify_lists = {
    { type = 'sessions',  header = { "    Sessions:" } },
    { type = 'dir',       header = { "    Recent files from " .. vim.fn.getcwd() .. ":" } },
    { type = 'bookmarks', header = { "    Bookmarks:" } },
    { type = 'commands',  header = { "    Commands:" } },
}

function _G.webDevIcons(path)
    local filename = vim.fn.fnamemodify(path, ':t')
    local extension = vim.fn.fnamemodify(path, ':e')
    return require 'nvim-web-devicons'.get_icon(filename, extension, { default = true })
end

vim.cmd [[
    function! StartifyEntryFormat()
        return 'v:lua.webDevIcons(absolute_path) ." ". entry_path'
    endfunction
]]

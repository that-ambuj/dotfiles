vim.g.loaded_matchparen = 1

vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab Settigns
local function tabs(tabsize)
    vim.opt.tabstop = tabsize
    vim.opt.softtabstop = tabsize
    vim.opt.shiftwidth = tabsize
    vim.opt.expandtab = true

    vim.opt.smartindent = true
    vim.opt.autoindent = true
end

tabs(4)

-- Tab size in html
vim.api.nvim_create_autocmd("FileType", {
    pattern = "html",
    callback = function()
        tabs(2)
    end
})

vim.opt.wrap = true

vim.opt.background = "dark"

-- Render white space and other characters
vim.opt.list = true

vim.opt.listchars = {
    -- eol = "↲",
    -- tab = "»·",
    -- space = "·",
    space = " ",
    tab = "  ",
    trail = "-",
}

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.cursorline = true

local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
    vim.api.nvim_create_autocmd(event, {
        group = group,
        pattern = pattern,
        callback = function()
            vim.opt_local.cursorline = value
        end,
    })
end

set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

vim.opt.fillchars = { eob = "~" }

vim.opt.joinspaces = false

vim.opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.syntax = 'on'


vim.cmd [[set syntax=on]]

vim.opt.scrolloff = 99
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 200

vim.g.mapleader = " "

-- vim.opt.clipboard = "unnamedplus"

vim.opt.belloff = "all"

vim.opt.foldmethod = "marker"
vim.opt.foldlevel = 0
vim.opt.modelines = 1

-- vim.opt.conceallevel = 2
-- vim.opt.concealcursor = nc

-- vim.opt.spell = true
-- vim.opt.spelllang = { 'en_us' }

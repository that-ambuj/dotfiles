vim.g.loaded_matchparen = 1

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false

-- Render white space and other characters
vim.opt.list = true

vim.opt.listchars = {
    -- eol = "↲",
    -- tab = "»·",
    tab = "··",
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

-- vim.opt.formatoptions = vim.opt.formatoptions + "a" -- Enables auto
-- formatting + "t" -- also enables auto formatting - "c" -- formats comments +
-- "q" -- allow formatting comments with gq - "o" -- don't continue comments +
-- "r" -- continue comments when pressing enter + "n" -- Indent past the
-- formatlistpat, not underneath it. + "j" -- Auto-remove comments if possible.
-- - "2" -- I'm not in gradeschool anymore

vim.opt.fillchars = { eob = "~" }

vim.opt.joinspaces = false

vim.opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 99
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 200

vim.g.mapleader = " "

vim.opt.wrap = true

vim.opt.clipboard = "unnamedplus"

vim.opt.belloff = "all"

vim.opt.foldmethod = "marker"
vim.opt.foldlevel = 0
vim.opt.modelines = 1

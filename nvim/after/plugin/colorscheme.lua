vim.opt.winblend = 0
vim.opt.pumblend = 0

-- For gruvbuddy
local gruvbuddy = function()
    require("colorbuddy").colorscheme("gruvbuddy")
end

-- Setup for Rose Pine
local rose_pine = function()
    require("rose-pine").setup({
        --- @usage 'auto'|'main'|'moon'|'dawn'
        variant = "moon",
    })

    vim.cmd("colorscheme rose-pine")
end

-- Enable Vitesse colorscheme
local vitesse = function()
    require("vitesse").setup()
end

-- Use github colorscheme
local github = function()
    require("github-theme").setup()
end

-- Call any of the above functions to use a theme
gruvbuddy()

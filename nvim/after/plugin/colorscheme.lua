vim.opt.winblend = 0
vim.opt.pumblend = 0

-- For gruvbuddy
local gruvbuddy = function()
    require("colorbuddy").colorscheme("gruvbuddy")

    vim.cmd.colorscheme("gruvbuddy")
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

local everforest = function()
    -- available variants "hard" | "medium"(default) | "soft"
    vim.g.everforest_background = "hard"

    vim.g.everforest_transparent_background = true
    vim.cmd.colorscheme("everforest")
end

local sonokai = function()
    -- available values: 'default' | 'atlantis' | 'andromeda' | 'shusia' | 'maia' | 'espresso'
    vim.g.sonokai_style = "atlantis"
    vim.g.sonokai_transparent_background = true

    vim.g.sonokai_better_performance = true
    vim.cmd.colorscheme("sonokai")
end

-- Call any of the above functions to use a theme
-- vitesse()
gruvbuddy()

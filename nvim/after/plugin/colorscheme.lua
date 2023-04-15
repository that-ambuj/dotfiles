-- vim.opt.winblend = 0
-- vim.opt.pumblend = 0

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

    vim.cmd.colorscheme("vitesse")
end

-- Use github colorscheme
local github = function()
    require("github-theme").setup()

    vim.cmd.colorscheme("github_dark")
end

local material = function()
    -- available variants: "darker" | "lighter" | "oceanic" | "palenight" | "deep ocean"
    vim.g.material_style = "darker"

    require("material").setup({})

    vim.cmd.colorscheme("material")
end

local everforest = function()
    -- available variants "hard" | "medium"(default) | "soft"
    vim.g.everforest_background = "hard"
    vim.g.everforest_transparent_background = true
    vim.cmd.colorscheme("everforest")
end

local sonokai = function()
    -- available values: 'default' | 'atlantis' | 'andromeda' | 'shusia' | 'maia' | 'espresso'
    vim.g.sonokai_style = "default"
    vim.g.sonokai_transparent_background = false

    vim.g.sonokai_better_performance = false
    vim.cmd.colorscheme("sonokai")
end

local cobalt = function()
    require("colorbuddy").colorscheme("cobalt2")
end

local synthwave = function()
    require("synthwave84").setup()

    vim.cmd.colorscheme("synthwave84")
end

local iceberg = function()
    vim.cmd.colorscheme("iceberg")
end

-- Call any of the above functions to use a theme
-- gruvbuddy()
rose_pine()

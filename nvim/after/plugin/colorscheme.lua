-- For gruvbuddy
local function gruvbuddy()
    require("colorbuddy").colorscheme("gruvbuddy")

    vim.cmd.colorscheme("gruvbuddy")
end

-- Setup for Rose Pine
local function rose_pine()
    require("rose-pine").setup({
        --- @usage 'auto'|'main'|'moon'|'dawn'
        variant = "moon",
    })

    vim.cmd("colorscheme rose-pine")
end

-- Enable Vitesse colorscheme
local function vitesse()
    require("vitesse").setup()

    vim.cmd.colorscheme("vitesse")
end

-- Use github colorscheme
local function github()
    require("github-theme").setup()

    vim.cmd.colorscheme("github_dark")
end

local function material()
    -- available variants: "darker" | "lighter" | "oceanic" | "palenight" | "deep ocean"
    vim.g.material_style = "darker"

    require("material").setup({})

    vim.cmd.colorscheme("material")
end

local function everforest()
    -- available variants "hard" | "medium"(default) | "soft"
    vim.g.everforest_background = "hard"
    vim.g.everforest_transparent_background = true
    vim.cmd.colorscheme("everforest")
end

local function sonokai()
    -- available values: 'default' | 'atlantis' | 'andromeda' | 'shusia' | 'maia' | 'espresso'
    vim.g.sonokai_style = "andromeda"
    vim.g.sonokai_transparent_background = false

    vim.g.sonokai_better_performance = false
    vim.cmd.colorscheme("sonokai")
end

local function cobalt()
    require("colorbuddy").colorscheme("cobalt2")
end

local function synthwave()
    require("synthwave84").setup()

    vim.cmd.colorscheme("synthwave84")
end

local function iceberg()
    vim.cmd.colorscheme("iceberg")
end

local function vscode()
    vim.opt.background = "dark"

    require("vscode").load()
end

local function dracula()
    require("dracula").setup()

    vim.cmd.colorscheme("dracula")
end

-- Call any of the above functions to use a theme
-- gruvbuddy()
vscode()

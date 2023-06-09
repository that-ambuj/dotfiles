-- For gruvbuddy
local function gruvbuddy()
    require("colorbuddy").colorscheme("gruvbuddy")

    vim.cmd("colorscheme gruvbuddy")
end

local function rose_pine()
    require("rose-pine").setup({
        --- @usage 'auto'|'main'|'moon'|'dawn'
        variant = "moon",
    })

    vim.cmd("colorscheme rose-pine")
end

local function vitesse()
    require("vitesse").setup()

    vim.cmd.colorscheme("vitesse")
end

local function github()
    require("github-theme").setup()

    vim.cmd.colorscheme("github_dark")
end

local function material()
    --- @usage "darker" | "lighter" | "oceanic" | "palenight" | "deep ocean"
    vim.g.material_style = "deep ocean"

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
    --- @usage: 'default' | 'atlantis' | 'andromeda' | 'shusia' | 'maia' | 'espresso'
    vim.g.sonokai_style = "default"
    vim.g.sonokai_transparent_background = false

    vim.g.sonokai_better_performance = false
    vim.cmd.colorscheme("sonokai")
end

local function cobalt()
    require("colorbuddy").colorscheme("cobalt2")
end

local function iceberg()
    vim.cmd.colorscheme("iceberg")
end

local function vscode()
    vim.opt.background = "dark"
    require("vscode").load()

    vim.cmd.colorscheme("vscode")
end

local function dracula()
    require("dracula").setup()

    vim.cmd.colorscheme("dracula")

    -- Soft variant
    -- vim.cmd.colorscheme("dracula-soft")
end

local function poimandres()
    require("poimandres").setup()

    vim.cmd.colorscheme("poimandres")
end

local function monokai()
    require("monokai").setup({
        palette = require("monokai").soda
    })
end

local function ayu()
    require("ayu").setup({
        mirage = true,
        overrides = {}
    })

    vim.cmd.colorscheme("ayu-mirage")
end

local function catppuccin()
    require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        term_colors = true,
        custom_highlights = function(colors)
            return {
                -- For indent-blankline
                -- IndentBlanklineChar = { fg = colors.surface1, nocombine = true },
                -- IndentBlanklineSpaceChar = { fg = colors.surface1, nocombine = true },
                -- IndentBlanklineSpaceCharBlankline = { fg = colors.surface1, nocombine = true },
                -- IndentBlanklineContextChar = { fg = colors.surface2, style = { "bold" }, nocombine = true },
                -- IndentBlanklineIndent1 = { fg = colors.surface0, nocombine = true }
            }
        end
    })

    vim.cmd("colorscheme catppuccin")
end

local function oxocarbon()
    vim.cmd("colorscheme oxocarbon")
end

local function kanagawa()
    vim.cmd("colorscheme kanagawa-wave")
end

local function tokyo_night()
    require("tokyonight").setup({
        --- @variants: "storm" | "moon" | "night"
        style = "moon"
    })

    vim.cmd("colorscheme tokyonight")
end

local function jellybeans()
    vim.cmd("colorscheme jellybeans-nvim")
end

-- Call any of the above functions to use a theme
jellybeans()

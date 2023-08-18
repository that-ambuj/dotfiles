local themes = {}

-- For gruvbuddy
themes.gruvbuddy = function()
    require("colorbuddy").colorscheme("gruvbuddy")

    vim.cmd("colorscheme gruvbuddy")
end

themes.rose_pine = function()
    require("rose-pine").setup({
        --- @usage 'auto'|'main'|'moon'|'dawn'
        variant = "main",
    })

    vim.cmd("colorscheme rose-pine")
end

themes.vitesse = function()
    require("vitesse").setup()

    vim.cmd.colorscheme("vitesse")
end

themes.github = function()
    require("github-theme").setup()

    vim.cmd.colorscheme("github_dark_dimmed")
end

themes.material = function()
    --- @usage "darker" | "lighter" | "oceanic" | "palenight" | "deep ocean"
    vim.g.material_style = "darker"

    require("material").setup({})

    vim.cmd.colorscheme("material")
end

themes.everforest = function()
    -- available variants "hard" | "medium"(default) | "soft"
    vim.g.everforest_background = "medium"
    vim.g.everforest_transparent_background = false
    vim.cmd.colorscheme("everforest")
end

themes.sonokai = function()
    --- @usage: 'default' | 'atlantis' | 'andromeda' | 'shusia' | 'maia' | 'espresso'
    vim.g.sonokai_style = "default"
    vim.g.sonokai_transparent_background = false

    vim.g.sonokai_better_performance = false
    vim.cmd.colorscheme("sonokai")
end

themes.cobalt = function()
    require("colorbuddy").colorscheme("cobalt2")
end

themes.iceberg = function()
    vim.cmd.colorscheme("iceberg")
end

themes.vscode = function()
    vim.opt.background = "dark"
    require("vscode").load()

    vim.cmd.colorscheme("vscode")
end

themes.dracula = function()
    require("dracula").setup()

    vim.cmd.colorscheme("dracula")

    -- Soft variant
    -- vim.cmd.colorscheme("dracula-soft")
end

themes.poimandres = function()
    require("poimandres").setup()

    vim.cmd.colorscheme("poimandres")
end

themes.monokai = function()
    require("monokai").setup({
        palette = require("monokai").soda
    })
end

themes.ayu = function()
    require("ayu").setup({
        mirage = true,
        overrides = {}
    })

    vim.cmd.colorscheme("ayu-mirage")
end

themes.catppuccin = function()
    require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        term_colors = true,
    })

    vim.cmd("colorscheme catppuccin")
end

themes.oxocarbon = function()
    vim.cmd("colorscheme oxocarbon")
end

themes.kanagawa = function()
    -- @variants: "kanagawa-wave", "kanagawa-dragon" and "kanagawa-lotus"(the light one)
    vim.cmd("colorscheme kanagawa-wave")
end

themes.tokyo_night = function()
    require("tokyonight").setup({
        --- @variants: "storm" | "moon" | "night"
        style = "night"
    })

    vim.cmd("colorscheme tokyonight")
end

themes.jellybeans = function()
    vim.cmd("colorscheme jellybeans-nvim")
end

themes.darcula = function()
    vim.cmd("colorscheme darcula")
end

themes.gruvbox = function()
    require("gruvbox").setup({
        --- @variants: "soft", "hard", "" (empty string for default )
        contrast = "",
    })

    vim.cmd("colorscheme gruvbox")
end

themes.mellow = function()
    vim.cmd("colorscheme mellow")
end

themes.habamax = function()
    vim.cmd("colorscheme habamax")
end

themes.onedark_nvim = function()
    require("onedark").setup({
        -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        style = "warmer"
    })

    require("onedark").load()
end

-- Call any of the above functions to use a theme
themes.onedark_nvim()

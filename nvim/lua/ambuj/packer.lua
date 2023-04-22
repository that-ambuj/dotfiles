vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- Colorscheme stuff
    use("tjdevries/colorbuddy.nvim")
    -- Colorbuddy themes
    use("tjdevries/gruvbuddy.nvim")
    use("bbenzikry/snazzybuddy.nvim")
    use("marko-cerovac/material.nvim")
    use("LunarVim/synthwave84.nvim")
    use("lalitmee/cobalt2.nvim")

    -- Non Colorbuddy themes
    use("2nthony/vitesse.nvim")
    use("cocopon/iceberg.vim")
    use("Mofiqul/vscode.nvim")
    -- use({ "dracula/vim", as = "dracula" })
    use("Mofiqul/dracula.nvim")

    use("projekt0n/github-nvim-theme")

    use({
        "rose-pine/neovim",
        as = "rose-pine",
    })

    use({ "sainnhe/everforest", as = "everforest" })
    use({ "sainnhe/sonokai", as = "sonokai" })

    use("nvim-lua/plenary.nvim")
    -- For status line
    use("tjdevries/express_line.nvim")

    -- Lazygit Integration
    use("kdheepak/lazygit.nvim")

    use("mhinz/vim-startify")

    use("simrat39/rust-tools.nvim")
    use("akinsho/flutter-tools.nvim")

    -- brackets and quotes autopairs
    use({
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup({}) end,
    })

    use({
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500

            require("which-key").setup({})
        end,
    })

    use({
        "folke/neodev.nvim",
        config = function() require("neodev").setup({}) end,
    })

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("theprimeagen/harpoon")
    use("mbbill/undotree")

    use("hrsh7th/cmp-path")

    -- Shows git changes in sign column on the left
    use("airblade/vim-gitgutter")

    -- Extension to remember cursor position
    use("farmergreg/vim-lastplace")

    -- Git related plugins
    -- use 'tpope/vim-fugitive'
    use("tpope/vim-rhubarb")

    -- Detect tabstop and shiftwidth automatically
    use("tpope/vim-sleuth")

    use("j-hui/fidget.nvim")

    use({
        'numToStr/Comment.nvim',
        config = function()
            require("Comment").setup()
        end
    })

    use("akinsho/toggleterm.nvim")

    -- install without yarn or npm
    -- use({
    --     "iamcco/markdown-preview.nvim",
    --     run = function() vim.fn["mkdp#util#install"]() end,
    -- })

    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })

    use("norcalli/nvim-colorizer.lua")

    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {                 -- LSP
            "neovim/nvim-lspconfig", -- Required
            {
                "williamboman/mason.nvim",
                run = function() vim.cmd("MasonUpdate") end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            --      -- Autocompletion
            { "hrsh7th/nvim-cmp" },     -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "L3MON4D3/LuaSnip" },     -- Required
        },
    })

    use("saadparwaiz1/cmp_luasnip")

    -- C/C++ stuff
    use("p00f/clangd_extensions.nvim")

    -- Snipppets
    use("rafamadriz/friendly-snippets")
    use("Nash0x7E2/awesome-flutter-snippets")

    -- Indent Highlighting
    use("lukas-reineke/indent-blankline.nvim")

    -- Typescript stuff
    use("jose-elias-alvarez/typescript.nvim")

    use('mfussenegger/nvim-dap')
end)

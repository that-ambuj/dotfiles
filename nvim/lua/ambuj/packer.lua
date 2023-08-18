vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    use("folke/trouble.nvim");

    -- Colorscheme stuff
    use("tjdevries/colorbuddy.nvim")
    -- Colorbuddy themes
    use("tjdevries/gruvbuddy.nvim")
    use("bbenzikry/snazzybuddy.nvim")
    use("marko-cerovac/material.nvim")
    use("lalitmee/cobalt2.nvim")

    -- Non Colorbuddy themes
    use("2nthony/vitesse.nvim")
    use("cocopon/iceberg.vim")
    use("Mofiqul/vscode.nvim")
    use("Mofiqul/dracula.nvim")
    use("olivercederborg/poimandres.nvim")
    use("Shatur/neovim-ayu")

    use("tanvirtin/monokai.nvim")

    use("projekt0n/github-nvim-theme")

    use({
        "rose-pine/neovim",
        tag = "main",
        as = "rose-pine",
    })

    use({ "catppuccin/nvim", as = "catppuccin" })

    use({ "sainnhe/everforest", as = "everforest" })
    use({ "sainnhe/sonokai", as = "sonokai" })
    use("nyoom-engineering/oxocarbon.nvim")
    use("rebelot/kanagawa.nvim")
    use("folke/tokyonight.nvim")
    use("doums/darcula")
    use("ellisonleao/gruvbox.nvim")
    use("kvrohit/mellow.nvim")
    use("navarasu/onedark.nvim")

    -- Lush.nvim themes
    use("rktjmp/lush.nvim")
    use("metalelf0/jellybeans-nvim")


    use("nvim-lua/plenary.nvim")
    -- For status line
    use("tjdevries/express_line.nvim")

    -- Lazygit Integration
    use("kdheepak/lazygit.nvim")

    use("mhinz/vim-startify")

    use("simrat39/rust-tools.nvim")
    use("akinsho/flutter-tools.nvim")
    use("mrcjkb/haskell-tools.nvim")

    use("simrat39/inlay-hints.nvim")

    -- use({ "that-ambuj/zig.vim", tag = "fix-disable-loclist" })

    -- brackets and quotes autopairs
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")

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

    use("folke/todo-comments.nvim")

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/nvim-treesitter-context")
    use("theprimeagen/harpoon")
    use("mbbill/undotree")

    use("hrsh7th/cmp-path")

    -- Shows git changes in sign column on the left
    use("lewis6991/gitsigns.nvim")

    -- Extension to remember cursor position
    use("farmergreg/vim-lastplace")

    -- Git related plugins
    -- use 'tpope/vim-fugitive'
    use("tpope/vim-rhubarb")

    -- Detect `tabstop` and `shiftwidth` automatically
    use("tpope/vim-sleuth")

    -- Surround Brackets
    use("tpope/vim-surround")

    use({ "j-hui/fidget.nvim", tag = "legacy" })

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

            --  auto-completion
            { "hrsh7th/nvim-cmp" },     -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "L3MON4D3/LuaSnip" },     -- Required
        },
    })

    use("lukas-reineke/lsp-format.nvim")

    -- prettier
    -- use("prettier/vim-prettier")

    use("jose-elias-alvarez/null-ls.nvim")
    use("jay-babu/mason-null-ls.nvim")

    use("saadparwaiz1/cmp_luasnip")

    -- C/C++ stuff
    use("p00f/clangd_extensions.nvim")

    -- Snippets
    use("rafamadriz/friendly-snippets")
    use("wyattferguson/jinja2-kit-vscode")

    -- Indent Highlighting
    use("lukas-reineke/indent-blankline.nvim")

    -- Typescript stuff
    use("jose-elias-alvarez/typescript.nvim")

    use('mfussenegger/nvim-dap')

    use('wakatime/vim-wakatime')
    use("nvim-tree/nvim-web-devicons")

    use("rest-nvim/rest.nvim")
    use("nvim-orgmode/orgmode")

    use({
        "f-person/git-blame.nvim",
    })
end)

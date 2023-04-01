vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function (use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Colorscheme stuff
    use 'tjdevries/colorbuddy.nvim'
    use 'tjdevries/gruvbuddy.nvim'
    use '2nthony/vitesse.nvim'
    use 'bbenzikry/snazzybuddy.nvim'
    use 'marko-cerovac/material.nvim'
    use 'nvim-lua/plenary.nvim'
    -- For status line
    use 'tjdevries/express_line.nvim'

    use 'mhinz/vim-startify'

    -- brackets and quotes autopairs
    use {
        'windwp/nvim-autopairs',
        config = function ()
            require("nvim-autopairs").setup {}
        end
    }

    use {
        'folke/which-key.nvim',
        config = function ()
            vim.o.timeout = true
            vim.o.timeoutlen = 500

            require('which-key').setup{}
        end
    }

    use {
        'folke/neodev.nvim',
        config = function ()
            require("neodev").setup({})
        end
    }

    use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use ('theprimeagen/harpoon')
    use ('mbbill/undotree')

    -- Git related plugins
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'

    -- Detect tabstop and shiftwidth automatically
    use 'tpope/vim-sleuth'

    use 'j-hui/fidget.nvim'

    use { 'VonHeikemen/lsp-zero.nvim', branch = 'v2.x', 
        requires = { -- LSP
            'neovim/nvim-lspconfig',             -- Required 
            { 'williamboman/mason.nvim', 
                run = function() pcall(vim.cmd, 'MasonUpdate') end, }, 
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            --      -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }
end)

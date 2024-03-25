return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

      ---@diagnostic disable-next-line
      parser_config.blade = {
        install_info = {
          url = 'https://github.com/EmranMR/tree-sitter-blade',
          files = { 'src/parser.c' },
          branch = 'main',
        },
        filetype = 'blade',
      }

      -- vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
      --   pattern = '*.blade.php',
      --   command = 'set ft=blade',
      -- })

      vim.filetype.add {
        pattern = {
          ['.*%.blade%.php'] = 'blade',
        },
      }

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          'c',
          'html',
          'lua',
          'markdown',
          'vim',
          'vimdoc',
          'css',
          'javascript',
          'blade',
        },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          filetype = {
            'html',
            'javascript',
            'typescript',
            'javascriptreact',
            'typescriptreact',
            'svelte',
            'vue',
            'tsx',
            'jsx',
            'rescript',
            'xml',
            'php',
            'blade',
            'markdown',
            'astro',
            'glimmer',
            'handlebars',
            'hbs',
          },
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            -- init_selection = '<M-o>',
            -- node_incremental = '<M-o>',
            -- scope_incremental = '<M-u>',
            -- node_decremental = '<M-i>',
          },
        },
      }

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
  { 'nvim-treesitter/nvim-treesitter-context' },
}
-- vim: ts=2 sts=2 sw=2 et

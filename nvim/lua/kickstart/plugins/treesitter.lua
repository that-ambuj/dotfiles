return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    config = function()
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter` (main branch)
      local ts = require 'nvim-treesitter'

      -- Install the parsers we use. On the `main` branch this compiles them
      -- via the tree-sitter CLI; already-installed parsers are skipped.
      ts.install {
        'bash',
        'c',
        'css',
        'go',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'rust',
        'vim',
        'vimdoc',
      }

      -- The `main` branch does not enable highlighting/indent automatically.
      -- Start them per-buffer whenever a parser is available for the filetype.
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('nvim_treesitter_start', { clear = true }),
        callback = function(ev)
          if pcall(vim.treesitter.start, ev.buf) then
            vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })

      -- Treesitter-based folding (uses Neovim's built-in foldexpr).
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.opt.foldenable = false
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        enable = true,
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

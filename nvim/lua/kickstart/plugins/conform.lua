return {
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 5000,
        lsp_fallback = false,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        blade = { 'blade-formatter' },
        php = { 'phpcbf', 'php_cs_fixer', 'phpactor' },
        rust = { 'rustfmt' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = { 'prettierd', 'prettier' },
        html = { 'prettierd', 'prettier' },
        typescript = { 'prettierd', 'prettier' },
        -- typescriptreact = { { 'prettierd', 'prettier' } },
        javascriptreact = { 'prettierd', 'prettier' },
        sql = { 'sql_formatter' },
      },
      formatters = {
        phpcbf = function(bufnr)
          return {
            command = require('conform.util').find_executable({ 'vendor/bin/phpcbf' }, 'phpcbf'),
            args = { '--standard=PSR12', '$FILENAME' },
            stdin = false,
            -- phpcbf ignores hidden files, so we have to override the default here
            tmpfile_format = 'conform.$RANDOM.$FILENAME',
            -- 0: no errors found
            -- 1: errors found
            -- 2: fixable errors found
            -- 3: processing error
            exit_codes = { 0, 1, 2 },
          }
        end,
        sql_formatter = {
          prepend_args = {
            '--config',
            [[{"language": "postgresql", 
            "tabWidth": 4, 
            "keywordCase": "upper",
            "dataTypeCase": "lower",
            "logicalOperatorNewline": "before"
            }]],
          },
        },
        rustfmt = {
          prepend_args = { '+nightly' },
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et

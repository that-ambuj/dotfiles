local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

parser_config.blade = {
  install_info = {
    url = 'https://github.com/EmranMR/tree-sitter-blade',
    files = { 'src/parser.c' },
    branch = 'v0.10.0',
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

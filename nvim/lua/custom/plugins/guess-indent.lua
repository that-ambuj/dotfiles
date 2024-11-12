return {
  'NMAC427/guess-indent.nvim',
  config = function()
    require('guess-indent').setup {
      auto_cmd = false,
    }

    vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
      desc = 'Guess Indent on opening or creating a buffer.',
      group = vim.api.nvim_create_augroup('guess-indent', { clear = true }),
      callback = function(event)
        if vim.bo.buftype == 'help' or vim.bo.buftype == 'nofile' or vim.bo.buftype == 'terminal' or vim.bo.buftype == 'prompt' then
          return
        end

        if vim.bo.filetype == 'netrw' or vim.bo.filetype == 'tutor' then
          return
        end

        vim.cmd [[:GuessIndent]]
      end,
    })
  end,
}

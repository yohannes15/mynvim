return {
  {
    'folke/trouble.nvim',
    cmd = { 'Trouble' },
    opts = {
      multiline = true,
    },
    keys = {
      {
        '<leader>tt',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = '[T]rouble (diagnostics) this workspace',
      },
      {
        '<leader>tT',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = '[T]rouble (diagnostics) this file',
      },
      {
        '<leader>tl',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Trouble: [l]ocation list',
      },
      {
        '<leader>tq',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Trouble: [q]uickfix',
      },
    },
  },
}

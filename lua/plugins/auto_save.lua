return {
  {
    'okuuva/auto-save.nvim',
    opts = {
      trigger_events = {
        immediate_save = { 'BufLeave', 'FocusLost', 'QuitPre', 'VimSuspend' },
        defer_save = { 'TextChanged', 'TextChangedI' },
        cancel_deferred_save = { 'InsertEnter' },
      },
      debounce_delay = 300,
    },
  },
}

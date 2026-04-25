return {
  {
    'scalameta/nvim-metals',
    ft = { 'scala', 'sbt', 'java' },
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      'saghen/blink.cmp',
    },
    opts = function()
      local metals_config = require('metals').bare_config()

      -- Use the same completion capabilities as the rest of the LSP stack.
      local metals_capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_blink, blink_cmp = pcall(require, 'blink.cmp')
      if ok_blink then
        metals_capabilities = blink_cmp.get_lsp_capabilities(metals_capabilities)
      end
      metals_config.capabilities = metals_capabilities

      -- Keep Metals in the standard LSP progress path. We already load fidget.nvim
      -- for progress notifications, so there is no need to keep Metals on its older
      -- custom status bar default.
      metals_config.init_options.statusBarProvider = 'off'

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        pattern = self.ft,
        callback = function()
          require('metals').initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  },
}

return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = '[H]arpoon [A]dd file' })
      vim.keymap.set('n', '<leader>h', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = '[H]arpoon menu' })

      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end, { desc = 'Harpoon to [1]' })
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end, { desc = 'Harpoon to [2]' })
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end, { desc = 'Harpoon to [3]' })
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end, { desc = 'Harpoon to [4]' })

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<leader>hp', function()
        harpoon:list():prev()
      end, { desc = 'Harpoon [P]revious' })
      vim.keymap.set('n', '<leader>hn', function()
        harpoon:list():next()
      end, { desc = 'Harpoon [N]ext' })
    end,
  },
}

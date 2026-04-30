return {
  {
    'lewis6991/gitsigns.nvim',
    ---@module 'gitsigns'
    ---@type Gitsigns.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, lhs, rhs, map_opts)
          map_opts = map_opts or {}
          map_opts.buffer = bufnr
          vim.keymap.set(mode, lhs, rhs, map_opts)
        end

        -- ]c / [c — jump hunks (or vanilla diff jump in diff mode)
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Previous git [c]hange' })

        -- Visual: stage / reset selection as a hunk
        map('v', '<leader>ghs', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [s]tage hunk' })
        map('v', '<leader>ghr', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [r]eset hunk' })

        map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
        map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
        map('n', '<leader>ghS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
        map('n', '<leader>ghR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
        map('n', '<leader>ghp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
        map('n', '<leader>ghi', gitsigns.preview_hunk_inline, { desc = 'git preview hunk [i]nline' })
        map('n', '<leader>ghb', function() gitsigns.blame_line { full = true } end, { desc = 'git [b]lame line (popup)' })
        map('n', '<leader>ghd', gitsigns.diffthis, { desc = 'git [d]iff vs index' })
        map('n', '<leader>ghD', function() gitsigns.diffthis '@' end, { desc = 'git [D]iff vs last commit' })
        map('n', '<leader>ghQ', function() gitsigns.setqflist 'all' end, { desc = 'git hunks → [Q]F (whole repo)' })
        map('n', '<leader>ghq', gitsigns.setqflist, { desc = 'git hunks → [q]f (this file)' })

        -- Under `<leader>gh` so they don’t clash with Trouble (`<leader>t…`).
        map('n', '<leader>ghB', gitsigns.toggle_current_line_blame, { desc = 'Toggle inline [B]lame' })
        map('n', '<leader>ghW', gitsigns.toggle_word_diff, { desc = 'Toggle [W]ord-diff' })

        map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'inner git [h]unk' })
      end,
    },
  },
}

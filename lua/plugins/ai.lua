return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local codecompanion = require("codecompanion")
      codecompanion.setup({
        interactions = {
          inline = {
            adapter = {
              name  = "opencode",
              model = "opencode/big-pickle"
            }
          }
        },
        strategies = {
          chat = {
            adapter = 'opencode',
          },
        },
        prompt_library = {
          markdown = {
            dirs = {
              vim.fn.stdpath("config") .. "/.prompts"
            }
          }
        },
        opts = {
          log_level = 'ERROR',
        },
        display = {
          diff = {
            enabled = true,
            close_chat_at = 240,  -- Close an open chat buffer if the total columns of your display are less than...
            layout = 'vertical',  -- vertical|horizontal split for default provider
            opts = { 'internal', 'filler', 'closeoff', 'algorithm:patience', 'followwrap', 'linematch:120' },
            provider = 'default', -- default|mini_diff
          },
        },
      })
    end,
  },
}

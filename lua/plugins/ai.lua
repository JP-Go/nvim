return {
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false, -- Never set this value to "*"! Never!
    auto_suggestions_provider = nil,
    config = function()
      require('copilot').setup({
        should_attach = function(_, bufname)
          if string.match(bufname, "env") then
            return false
          end
          return true
        end,
        model = 'claude-3.5-sonnet',
        extra_request_body = {
          temperature = 0,
          max_tokens = 8192,
        },
      })
      require('avante').setup({
        provider = 'copilot',
        behavior = {
          enable_cursor_planning_mode = true,
        },
        system_prompt = function()
          local hub = require('mcphub').get_hub_instance()
          return hub:get_active_servers_prompt() or ""
        end,
        -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
        custom_tools = function()
          return {
            require('mcphub.extensions.avante').mcp_tool(),
          }
        end,
      })
    end,
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = vim.fn.has("win32") ~= 0
        and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      {

        'ravitemer/mcphub.nvim',
        build = 'npm install -g mcp-hub@latest',
        config = function()
          require("mcphub").setup({
            use_bundled_binary = false,
            extensions = {
              avante = {
                make_slash_commands = true,
              },
            },
          })
        end
      },
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'zbirenbaum/copilot.lua', -- for providers='copilot'
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
          extensions = {
            avante = {
              make_slash_commands = true, -- make /slash commands from MCP server prompts
            },
          },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
}

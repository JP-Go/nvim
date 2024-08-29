return {
  {

    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      local dap, dapui = require('dap'), require('dapui')
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      require('dapui').setup()
      local wk = require('which-key')
      wk.add({
        {
          '<leader>d',
          group = 'DAP',
          desc = 'Continue',
        },
        {
          '<leader>db',
          function()
            dap.toggle_breakpoint()
          end,
          desc = 'Toggle breakpoint',
        },
        {
          '<leader>dc',
          function()
            dap.continue()
          end,
          desc = 'Continue',
        },
        {
          '<leader>di',
          function()
            dap.step_into()
          end,
          desc = 'Step into',
        },
        {
          '<leader>do',
          function()
            dap.step_over()
          end,
          desc = 'Step over',
        },
        {
          '<leader>dq',
          function()
            dap.close()
          end,
          desc = 'Step over',
        },
      })
      dap.adapters.coreclr = {
        type = 'executable',
        command = 'netcoredbg',
        args = { '--interpreter=vscode' },
      }
      dap.configurations.cs = {
        {
          type = 'coreclr',
          name = 'launch - netcoredbg',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/', 'file')
          end,
        },
      }
    end,
  },
}

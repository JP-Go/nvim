return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-go",
    {

      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },

    }
  },
  config = function()
    local neotest = require("neotest")
    neotest.setup({
      run = {
        augment = function(tree, args)
          args.env = { TZ = "UTC" }

          return args
        end,
      },
      adapters = {
        require("neotest-vitest")({
          filter_dir = function(name, rel_path, root)
            return name ~= "node_modules"
          end,
        }),
        require("neotest-jest")({
          isTestFile = require("neotest-jest.jest-util").defaultIsTestFile,
        }),
        require("neotest-go"),
      }
    })
    vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, {
      desc = "Open/Close test summary"
    })
    vim.keymap.set("n", "<leader>tr", neotest.run.run, {
      desc = "Run current test"
    })
    vim.keymap.set("n", "<leader>tf", function()
      return neotest.run.run(vim.fn.expand("%"))
    end, {
      desc = "Run test file"
    })
    vim.keymap.set("n", "<leader>td", function()
      local reply = vim.fn.input("Run debug in (Default is 1):\n  1. Current test.\n  2. Current file.\n Choice: ", "1")
      if reply == "1" then
        return neotest.run.run({ suite = false, strategy = "dap" })
      elseif reply == "2" then
        return neotest.run.run({ suite = true, strategy = "dap" })
      end
    end, {
      desc = "Debug test"
    })
  end,
}

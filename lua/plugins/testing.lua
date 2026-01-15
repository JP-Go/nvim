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
    require("neotest").setup({
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
  end
}

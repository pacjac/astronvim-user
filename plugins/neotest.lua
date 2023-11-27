return {
  "nvim-neotest/neotest",
  event = "BufRead",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-python" {
          dap = {
            JustMyCode = false,
          },
          runner = "pytest",
          -- python = ".venv/bin/python"
        },
      },
    }
  end,
}

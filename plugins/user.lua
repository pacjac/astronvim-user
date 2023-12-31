return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
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

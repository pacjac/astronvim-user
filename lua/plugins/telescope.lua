return {
  "nvim-telescope/telescope.nvim",
  dependencies = { -- add a new dependency to telescope that is our new plugin
    "nvim-telescope/telescope-media-files.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      lazy = true,
      enabled = vim.fn.executable "make" == 1,
      build = "make",
    },
  },
  opts = function()
    local actions = require "telescope.actions"
    return {
      defaults = {
        git_worktrees = vim.g.git_worktrees,
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.cycle_history_next,
            ["<C-k>"] = actions.cycle_history_prev,
          },
          n = { q = actions.close },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    }
  end,
  -- the first parameter is the plugin specification
  -- the second is the table of options as set up in Lazy with the `opts` key
  config = function(plugin, opts)
    -- run the core AstroNvim configuration function with the options table
    local telescope = require "telescope"
    telescope.setup(opts)
    local is_available = require("astrocore").is_available
    if is_available "nvim-notify" then telescope.load_extension "notify" end
    if is_available "aerial.nvim" then telescope.load_extension "aerial" end
    if is_available "telescope-fzf-native.nvim" then telescope.load_extension "fzf" end
    if is_available "telescope-media-files" then telescope.load_extension "media_files" end
  end,
}

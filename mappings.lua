-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- Toggle mypy annotations, useful for focused work
    ["<leader>lm"] = {
      function() require("null-ls").toggle { "mypy" } end,
      desc = "Toggle mypy virtual text",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>tt"] = {
      function() require("transparent").toggle() end,
      desc = "Toggle transparency",
    },

    -- Noetest commands
    ["<leader>mt"] = { "<cmd>Neotest run<cr>", desc = "Run all tests" },
    ["<leader>ml"] = { function() require("neotest").run.run(vim.fn.expand "%") end, desc = "Run this file" },
    ["<leader>md"] = { function() require("neotest").run.run { strategy = "dap" } end, desc = "Debug this test" },
    ["<leader>ma"] = { function() require("neotest").run.attach() end, desc = "Debug this test" },
    ["<leader>mo"] = { function() require("neotest").output.open() end, desc = "Open Test result" },
    ["<leader>mO"] = { function() require("neotest").output.open { enter = true } end, desc = "Open Test result" },
    ["<leader>ms"] = { "<cmd>Neotest summary<cr>", desc = "Toggle Summary" },
  },
}

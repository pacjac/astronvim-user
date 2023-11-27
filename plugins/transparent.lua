return {
  "xiyaowong/transparent.nvim",
  event = "BufReadPre",
  config = function()
    require("transparent").setup { -- Optional, you don't have to run setup.
      groups = { -- table: default groups
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        "CursorLine",
        "CursorLineNr",
        "StatusLine",
        "StatusLineNC",
        "EndOfBuffer",
      },
      extra_groups = { "NormFloat", "NeoTreeNormal", "NeoTreeNormalNC", "NotifyBackground" }, -- table: additional groups that should be cleared
      exclude_groups = {}, -- table: groups you don't want to clear
    }

    -- Add additional groups to clear
    vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "ExtraGroup" })
    -- vimscript: let g:transparent_groups = extend(get(g:, 'transparent_groups', []), ["ExtraGroup"])
    --
    -- Use with bufferline
    --   vim.g.transparent_groups = vim.list_extend(
    --     vim.g.transparent_groups or {},
    --     vim.tbl_map(function(v) return v.hl_group end, vim.tbl_values(require("bufferline.config").highlights))
    --   )
  end,
}

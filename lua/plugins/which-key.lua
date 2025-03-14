return {
  "folke/which-key.nvim",
  opts = {
    preset = "helix", -- "classic" | "modern" | "helix"
    --- Available sorters}
    --- * local: buffer-local mappings first
    --- * order: order of the items (Used by plugins like marks / registers)
    --- * group: groups last
    --- * alphanum: alpha-numerical first
    --- * mod: special modifier keys last
    --- * manual: the order the mappings were added
    --- * case: lower-case first
    -- sort = { "local", "order", "group", "alphanum", "mod" },
    sort = { "local", "order", "alphanum", "case", "mod", "group" },
    win = {
      -- don't allow the popup to overlap with the cursor
      -- no_overlap = true,
      -- width = 1,
      height = { min = 4, max = 30 },
      -- col = 0,
      -- row = math.huge,
      -- border = "none",
      -- padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
      -- title = true,
      -- title_pos = "center",
      -- zindex = 1000,
      -- Additional vim.wo and vim.bo options
      -- bo = {},
      -- wo = {
      -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      -- },
    },
  },
}

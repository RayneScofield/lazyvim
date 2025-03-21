local prefix = "<leader>c"

return {
  "barrett-ruth/live-server.nvim",
  ft = { "html" },
  build = "npm install -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop" },
  opts = {},
  keys = {
    {
      prefix .. "w",
      function()
        vim.cmd([[LiveServerStart]])
      end,
      desc = "Start live server",
    },
    {
      prefix .. "W",
      function()
        vim.cmd([[LiveServerStop]])
      end,
      desc = "Stop live server",
    },
  },
}

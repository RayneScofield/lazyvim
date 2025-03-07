-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- make q close help, man , quickfix, dap floats
vim.api.nvim_create_autocmd("BufWinEnter", {
  desc = "Make q close help, man, quickfix, dap floats",
  callback = function(args)
    -- Add cache for buffers that have already had mappings created
    if not vim.g.q_close_windows then
      vim.g.q_close_windows = {}
    end
    -- If the buffer has been checked already, skip
    if vim.g.q_close_windows[args.buf] then
      return
    end
    -- Mark the buffer as checked
    vim.g.q_close_windows[args.buf] = true
    -- Check to see if `q` is already mapped to the buffer (avoids overwriting)
    for _, map in ipairs(vim.api.nvim_buf_get_keymap(args.buf, "n")) do
      if map.lhs == "q" then
        return
      end
    end
    -- If there is no q mapping already and the buftype is a non-real file, create one
    if vim.tbl_contains({ "help", "nofile", "quickfix" }, vim.bo[args.buf].buftype) then
      vim.keymap.set("n", "q", "<Cmd>close<CR>", {
        desc = "Close window",
        buffer = args.buf,
        silent = true,
        nowait = true,
      })
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  desc = "Clean up q_close_windows cache",
  callback = function(args)
    if vim.g.q_close_windows then
      vim.g.q_close_windows[args.buf] = nil
    end
  end,
})

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- -- Disable auto comments on new line
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "*",
--   callback = function()
--     vim.opt_local.formatoptions:remove({ "c", "o" })
--   end,
-- })

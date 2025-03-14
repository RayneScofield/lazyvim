-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- ray
keymap.set("i", "<C-l>", "<Right>", { desc = "Move right", noremap = true, silent = true })
keymap.set("i", "<C-h>", "<Left>", { desc = "Move left", noremap = true, silent = true })
-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- keymap.set("n", "H", "^", { desc = "Go to start without blank" })
-- keymap.set("n", "L", "$", { desc = "Go to end without blank" })

keymap.set("v", "K", ":move '<-2<CR>gv-gv", { desc = "Move line up", noremap = true, silent = true })
keymap.set("v", "J", ":move '>+1<CR>gv-gv", { desc = "Move line down", noremap = true, silent = true })

keymap.set("n", "n", require("utils").better_search("n"), { desc = "Next Search", noremap = true, silent = true })
keymap.set("n", "N", require("utils").better_search("N"), { desc = "Previous Search", noremap = true, silent = true })

keymap.set("n", "n", "nzz", { noremap = true, silent = true })
keymap.set("n", "N", "Nzz", { noremap = true, silent = true })

-- keymap.set("n", "x", '"_x', { noremap = true, silent = true })
-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p', { desc = "which_key_ignore" })
keymap.set("n", "<Leader>P", '"0P', { desc = "which_key_ignore" })
keymap.set("v", "<Leader>p", '"0p', { desc = "which_key_ignore" })
keymap.set("n", "<Leader>c", '"_c', { desc = "which_key_ignore" })
keymap.set("n", "<Leader>C", '"_C', { desc = "which_key_ignore" })
keymap.set("v", "<Leader>c", '"_c', { desc = "which_key_ignore" })
keymap.set("v", "<Leader>C", '"_C', { desc = "which_key_ignore" })
keymap.set("n", "<Leader>d", '"_d', { desc = "which_key_ignore" })
keymap.set("n", "<Leader>D", '"_D', { desc = "which_key_ignore" })
keymap.set("v", "<Leader>d", '"_d', { desc = "which_key_ignore" })
keymap.set("v", "<Leader>D", '"_D', { desc = "which_key_ignore" })

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set("n", "<leader>/", LazyVim.pick("live_grep", { root = false }), { desc = "Grep (cwd)" })

if LazyVim.has("mini.pairs") then
  -- for mini.pairs
  local map_bs = function(lhs, rhs)
    keymap.set("i", lhs, rhs, { expr = true, replace_keycodes = false })
  end
  -- map_bs("<C-h>", "v:lua.MiniPairs.bs()")
  map_bs("<C-w>", 'v:lua.MiniPairs.bs("\23")')
  map_bs("<C-u>", 'v:lua.MiniPairs.bs("\21")')
end

-- for lsp
keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.showbreak = "↪ "
vim.opt.wrap = false
vim.g.lazyvim_picker = "fzf"
vim.g.lazyvim_cmp = "blink.cmp"
vim.g.ai_cmp = false
vim.g.lazyvim_check_order = false
vim.g.autoformat = false

-- ray
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.number = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
-- vim.opt.cmdheight = 1
-- vim.opt.laststatus = 3

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

-- @ray
vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
    cache_enable = 0,
}

-- filetypes
LazyVim.on_very_lazy(function()
  vim.filetype.add({
    extension = {
      mdx = "markdown.mdx",
      qmd = "markdown",
      yml = require("utils").yaml_ft,
      yaml = require("utils").yaml_ft,
      json = "jsonc",
      MD = "markdown",
      tpl = "gotmpl",
    },
    filename = {
      [".eslintrc.json"] = "jsonc",
      ["vimrc"] = "vim",
    },
    pattern = {
      ["/tmp/neomutt.*"] = "markdown",
      ["tsconfig*.json"] = "jsonc",
      [".*/%.vscode/.*%.json"] = "jsonc",
      [".*/waybar/config"] = "jsonc",
    },
  })
end)

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.opt.guicursor = ""

vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

vim.opt.breakindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

-- vim.opt.list = true
-- vim.opt.listchars = { tab = ">> ", trail = ".", nbsp = "_" }

vim.opt.inccommand = "split"

vim.opt.cursorline = true
vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 80

vim.opt.colorcolumn = "80"

vim.opt.foldenable = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

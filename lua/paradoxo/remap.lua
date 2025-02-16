vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<ESC>", ":noh <CR>")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
vim.keymap.set("n", "<leader>ex", ":Ex<CR>", { desc = "Explorer" })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "{", "{zzzv")
vim.keymap.set("n", "}", "}zzzv")
vim.keymap.set("n", "<leader>p", [["_dP]])
vim.keymap.set("n", "<C-a>", ":%d<CR>i", { desc = "Delete whole file" } )

vim.keymap.set("n", "<leader>wo", "<C-w>o", { desc = "Close all other windows" })
vim.keymap.set("n", "<leader>wq", "<C-w>q", { desc = "Quit window" })
vim.keymap.set("n", "<leader>ww", "<C-w>q", { desc = "Switch windows" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to the right window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to the up window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to the down window" })

vim.keymap.set("n", "<leader>wH", "<C-w>H", { desc = "Move to the left window" })
vim.keymap.set("n", "<leader>wL", "<C-w>L", { desc = "Move to the right window" })
vim.keymap.set("n", "<leader>wK", "<C-w>K", { desc = "Move to the up window" })
vim.keymap.set("n", "<leader>wJ", "<C-w>J", { desc = "Move to the down window" })

vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split window horizontally" })

vim.keymap.set("n", "<leader>w+", "<C-w>+", { desc = "Increase height" })
vim.keymap.set("n", "<leader>w-", "<C-w>-", { desc = "Decrease height" })
vim.keymap.set("n", "<leader>w<", "<C-w><", { desc = "Increase width" })
vim.keymap.set("n", "<leader>w>", "<C-w>>", { desc = "Decrease width" })
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "Equally high and wide" })
vim.keymap.set("n", "<leader>w|", "<C-w>|", { desc = "Max out the width" })
vim.keymap.set("n", "<leader>w_", "<C-w>_", { desc = "Max out the height" })


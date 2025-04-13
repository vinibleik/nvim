vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n", "<ESC>", ":noh <CR>")
map("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
map("n", "<leader>ex", ":Ex<CR>", { desc = "Explorer" })
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "{", "{zzzv")
map("n", "}", "}zzzv")
map("n", "<leader>p", [["_dP]])
map("n", "<C-a>", ":%d<CR>i", { desc = "Delete whole file" })

map("n", "<leader>wo", "<C-w>o", { desc = "Close all other windows" })
map("n", "<leader>wq", "<C-w>q", { desc = "Quit window" })
map("n", "<leader>ww", "<C-w>q", { desc = "Switch windows" })

map("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to the right window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to the up window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to the down window" })

map("n", "<leader>wH", "<C-w>H", { desc = "Move to the left window" })
map("n", "<leader>wL", "<C-w>L", { desc = "Move to the right window" })
map("n", "<leader>wK", "<C-w>K", { desc = "Move to the up window" })
map("n", "<leader>wJ", "<C-w>J", { desc = "Move to the down window" })

map("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>ws", "<C-w>s", { desc = "Split window horizontally" })

map("n", "<leader>w+", "<C-w>+", { desc = "Increase height" })
map("n", "<leader>w-", "<C-w>-", { desc = "Decrease height" })
map("n", "<leader>w<", "<C-w><", { desc = "Increase width" })
map("n", "<leader>w>", "<C-w>>", { desc = "Decrease width" })
map("n", "<leader>w=", "<C-w>=", { desc = "Equally high and wide" })
map("n", "<leader>w|", "<C-w>|", { desc = "Max out the width" })
map("n", "<leader>w_", "<C-w>_", { desc = "Max out the height" })

map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })
map("n", "<leader>x", "<cmd>bd<CR>", { desc = "buffer delete" })

map("n", "<leader>rs", "<cmd>LspRestart<CR>", { desc = "LspRestart" })

map("n", "<leader>rn", function()
    local cmds = {
        python = "python3 %",
        javascript = "node %",
        typescript = "npx tsx %",
        go = "go run %",
    }
    local filetype = vim.bo.filetype
    local cmd = cmds[filetype]

    if cmd == nil then
        print("File format not supported")
        return
    end
    local percent_of_win = 0.4
    local cur_win_height = vim.api.nvim_win_get_height(0)
    local term_height = math.floor(cur_win_height * percent_of_win)
    vim.cmd(":below " .. term_height .. " split | terminal " .. cmd)
end, { desc = "Run the current file" })

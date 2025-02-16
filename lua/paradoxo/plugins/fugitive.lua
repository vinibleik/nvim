return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>git", vim.cmd.Git)
        vim.keymap.set("n", "gh", "<cmd>diffget //2<CR>")
        vim.keymap.set("n", "gl", "<cmd>diffget //3<CR>")

        local paradoxo_fugitive = vim.api.nvim_create_augroup("paradoxo_fugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = paradoxo_fugitive,
            pattern = "*",
            callback = function()
                local bufnr = vim.api.nvim_get_current_buf()

                local function opts(desc)
                    return {buffer = bufnr, remap = false, desc = desc}
                end

                vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR>", opts "Git Diff V Split")
                vim.keymap.set("n", "<leader>gP", function() vim.cmd.Git {"pull", "--rebase"} end, opts "Git Pull Rebase")
                vim.keymap.set("n", "<leader>gp", ":Git push -u origin", opts "Git Push Origin")
                vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", opts "Git Add all")
                vim.keymap.set("n", "<leader>gck", ":Git checkout", opts "Git Checkout")
                vim.keymap.set("n", "<leader>gsw", ":Git switch", opts "Git Switch")
                vim.keymap.set("n", "<leader>gsh", ":Git stash<CR>", opts "Git Stash")
                vim.keymap.set("n", "<leader>gsa", ":Git stash --include-untracked<CR>", opts "Git Stash All")
                vim.keymap.set("n", "<leader>gst", ":Git status<CR>", opts "Git Status")
                vim.keymap.set("n", "<leader>gcm", ":Git commit<CR>", opts "Git Commit")
            end,
        })
    end
}

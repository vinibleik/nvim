require("paradoxo.set")
require("paradoxo.remap")
require("paradoxo.lazy")

-- local augroup = vim.api.nvim_create_augroup
-- local autocmd = vim.api.nvim_create_autocmd

local yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 50,
        })
    end,
})

local paradoxo = vim.api.nvim_create_augroup("paradoxo", {})
vim.api.nvim_create_autocmd("BufEnter", {
    group = paradoxo,
    pattern = { "*.ts", "*.mts" },
    callback = function()
        vim.keymap.set("n", "<leader>cmp", function()
            local percent_of_win = 0.5
            local cur_win_height = vim.api.nvim_win_get_height(0)
            local term_height = math.floor(cur_win_height * percent_of_win)
            vim.cmd(":below " .. term_height .. " split | terminal npx tsc")
        end)
    end,
})
-- autocmd('LspAttach', {
--     group = paradoxo,
--     callback = function(e)
--         local opts = { buffer = e.buf }
--         vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--         vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--         vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--         vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--         vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--         vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--         vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--         vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--         vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--         vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--     end
-- })

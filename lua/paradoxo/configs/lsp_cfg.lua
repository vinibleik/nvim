local lspconfig = require("lspconfig")
local builtin = require("telescope.builtin")

local paradoxo_group = vim.api.nvim_create_augroup("paradoxo_lsp", {})
vim.api.nvim_create_autocmd("LspAttach", {
    group = paradoxo_group,
    callback = function(e)
        local function opts(desc)
            return { buffer = e.buf, desc = "LSP " .. desc }
        end

        local map = vim.keymap.set
        map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaraion"))
        -- map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
        map("n", "gd", builtin.lsp_definitions, opts("Go to definition"))
        -- map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
        map("n", "gi", builtin.lsp_implementations, opts("Go to implementation"))
        -- map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
        map("n", "<leader>D", builtin.lsp_type_definitions, opts("Go to type definition"))
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
        -- map("n", "gr", vim.lsp.buf.references, opts "Show references")
        map("n", "gr", builtin.lsp_references, opts("Show references"))
        map("n", "K", vim.lsp.buf.hover, opts("Hover"))
        map("n", "gws", vim.lsp.buf.workspace_symbol, opts("Workspace symbol"))
        map("n", "<leader>ra", vim.lsp.buf.rename, opts("Rename"))
        map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Signature Help"))
        map("n", "<leader>q", vim.diagnostic.setloclist, opts("Diagnostic setloclist"))
        map("n", "[d", function()
            vim.diagnostic.goto_next({ float = { border = "rounded" } })
        end, opts("Goto next"))
        map("n", "]d", function()
            vim.diagnostic.goto_prev({ float = { border = "rounded" } })
        end, opts("Goto prev"))
        map("n", "<leader>fd", function()
            builtin.diagnostics({ bufnr = 0 })
        end, opts("Find diagnostics"))
    end,
})

local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), require("cmp_nvim_lsp").default_capabilities())

-- Python
lspconfig.pyright.setup({
    -- on_attach = on_attach So the LspAttach will be a on_attach function(client, bufnr)
    capabilities = capabilities,
    settings = {
        pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
        },
        -- python = {
        --     analysis = {
        --         -- Ignore all files for analysis to exclusively use Ruff for linting
        --         ignore = { "*" },
        --     },
        -- },
    },
})

lspconfig.ruff.setup({
    capabilities = capabilities,
})
-- Python

-- Web/Node.js
lspconfig.ts_ls.setup({
    capabilities = capabilities,
})
lspconfig.cssls.setup({
    capabilities = capabilities,
})
lspconfig.html.setup({
    capabilities = capabilities,
})
-- Web/Node.js

-- Go
lspconfig.gopls.setup({
    capabilities = capabilities,
    -- settings = { I'm using conform
    --     gopls = {
    --         gofumpt = true,
    --     },
    -- },
})
-- Go

-- Rust
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    -- settings = {
    -- to enable rust-analyzer settings visit:
    -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
    -- ["rust-analyzer"] = {
    -- enable clippy on save
    --         checkOnSave = {
    --             command = "clippy",
    --         },
    --     },
    -- },
})
-- Rust

-- Terraform
lspconfig.terraformls.setup({
    capabilities = capabilities,
})
-- Terraform

-- Docker
lspconfig.dockerls.setup({
    capabilities = capabilities,
})
-- Docker

-- Lua
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/luv/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})
-- Lua

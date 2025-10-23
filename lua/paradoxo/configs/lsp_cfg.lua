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
        map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
        -- map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
        map("n", "gi", builtin.lsp_implementations, opts("Go to implementation"))
        -- map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
        map("n", "<leader>D", builtin.lsp_type_definitions, opts("Go to type definition"))
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
        -- map("n", "gr", vim.lsp.buf.references, opts "Show references")
        map("n", "gr", builtin.lsp_references, opts("Show references"))
        map("n", "K", function()
            vim.lsp.buf.hover({ border = "rounded" })
        end, opts("Hover"))
        map("n", "gws", vim.lsp.buf.workspace_symbol, opts("Workspace symbol"))
        map("n", "<leader>ra", vim.lsp.buf.rename, opts("Rename"))
        map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Signature Help"))
        map("n", "<leader>q", vim.diagnostic.setloclist, opts("Diagnostic setloclist"))
        map("n", "[d", function()
            vim.diagnostic.jump({ float = { border = "rounded" }, count = 1 })
            -- vim.diagnostic.goto_next({ float = { border = "rounded" } })
        end, opts("Goto next"))
        map("n", "]d", function()
            vim.diagnostic.jump({ float = { border = "rounded" }, count = -1 })
            -- vim.diagnostic.goto_prev({ float = { border = "rounded" } })
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
        -- Ignore all files for analysis to exclusively use Ruff for linting
        -- ignore = { "*" },
        --     },
        -- },
    },
})

lspconfig.ruff.setup({
    capabilities = capabilities,
})
-- Python

vim.lsp.config("ts_ls", {
    ---@param client vim.lsp.Client
    ---@param bufnr integer
    on_attach = function(client, bufnr)
        vim.keymap.set("n", "<leader>org", function()
            client:exec_cmd({
                command = "_typescript.organizeImports",
                arguments = { vim.api.nvim_buf_get_name(bufnr) },
                title = "OrganizeImports",
            })
        end, { noremap = true, silent = true, buffer = bufnr, desc = "LSP Typescript OrganizeImports" })
    end,
    capabilities = capabilities,
    commands = {
        OrganizeImports = {},
    },
})
vim.lsp.enable("ts_ls")
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.ts", "*.js", "*.tsx", "*.jsx" },
    group = vim.api.nvim_create_augroup("FormatConfig", { clear = true }),
    callback = function(ev)
        local client = vim.lsp.get_clients({ name = "ts_ls", bufnr = ev.buf })[1]

        if not client then
            return
        end

        local request_result = client:request_sync("workspace/executeCommand", {
            command = "_typescript.organizeImports",
            arguments = { vim.api.nvim_buf_get_name(ev.buf) },
        })

        if request_result and request_result.err then
            vim.notify(request_result.err.message, vim.log.levels.ERROR)
            return
        end
        -- local conform_opts = { bufnr = ev.buf, lsp_format = "prettierd", timeout_ms = 2000 }
        -- require("conform").format(conform_opts)
    end,
})

-- Web/Node.js
-- lspconfig.ts_ls.setup({
--     capabilities = capabilities,
-- })
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

lspconfig.docker_compose_language_service.setup({
    capabilities = capabilities,
    filetypes = { "yaml.docker-compose", "yaml", "yml" },
    settings = {
        telemetry = {
            telemetryLevel = "off",
        },
    },
})
-- vim.lsp.config("docker_language_server", {
--     cmd = { "docker-language-server", "start", "--stdio" },
--     filetypes = { "dockerfile", "yaml.docker-compose" },
--     settings = {
--         telemetry = "off",
--     },
--     telemetry = "off",
--     root_markers = {
--         "Dockerfile",
--         "docker-compose.yaml",
--         "docker-compose.yml",
--         "compose.yaml",
--         "compose.yml",
--         "docker-bake.json",
--         "docker-bake.hcl",
--         "docker-bake.override.json",
--         "docker-bake.override.hcl",
--     },
-- })
-- vim.lsp.enable("docker_language_server")
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

-- Powershell
lspconfig.powershell_es.setup({
    -- capabilities = capabilities,
    bundle_path = "/home/vinicius/.local/share/nvim/mason/packages/powershell-editor-services",
})
-- Powershell

-- Bash
lspconfig.bashls.setup({
    capabilities = capabilities,
})
-- Bash

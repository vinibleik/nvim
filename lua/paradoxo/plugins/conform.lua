return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>fm",
            function()
                require("conform").format({ async = true })
            end,
            mode = "n",
            desc = "Format buffer",
        },
    },
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            python = { "ruff_fix", "ruff_format" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            html = { "prettierd", "prettier", stop_after_first = true },
            css = { "prettierd", "prettier", stop_after_first = true },
            scss = { "prettierd", "prettier", stop_after_first = true },
            json = { "prettierd", "prettier", stop_after_first = true },
            jsonc = { "prettierd", "prettier", stop_after_first = true },
            yaml = { "prettierd", "prettier", stop_after_first = true },
            go = { "gofumpt", "goimports" },
            rust = { "rustfmt", lsp_format = "fallback" },
            sql = { "sqruff" },
            terraform = { "terraform_fmt" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        -- Customize formatters
        formatters = {
            -- shfmt = {
            --   prepend_args = { "-i", "2" },
            -- },
        },
    },
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}

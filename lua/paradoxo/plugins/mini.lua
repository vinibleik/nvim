return {
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function()
            require("mini.ai").setup({ n_lines = 500 })
            require("mini.pairs").setup({})
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end,
    },
}

return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",

    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },

    config = function()
        require('telescope').setup({})

        require('telescope').load_extension('fzf')

        local builtin = require('telescope.builtin')
        local map = vim.keymap.set
        map('n', '<leader>fh', builtin.help_tags, { desc = "Find Help" })
        map('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
        map('n', '<leader>fa', function() builtin.find_files({no_ignore = true, hidden=true}) end, { desc = "Find All Files" })
        map('n', '<leader>fg', builtin.live_grep, { desc = "Find Grep" })
        map("n", "<leader>fc", builtin.git_commits, { desc = "Find commits" } )
        map("n", "<leader>fs", builtin.git_status, { desc = "Find status" } )
    end
}

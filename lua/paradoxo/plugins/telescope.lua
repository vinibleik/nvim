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
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find Help" })
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
        vim.keymap.set('n', '<leader>fa', function() builtin.find_files({no_ignore = true}) end, { desc = "Find Files" })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Find Grep" })
    end
}

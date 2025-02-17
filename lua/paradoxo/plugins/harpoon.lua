return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({
            settings = {
                save_on_toggle = true, -- Save after alter the ui
                -- sync_on_ui_close = false,
            },
        })

        vim.keymap.set("n", "<A-m>", function()
            harpoon:list():add()
        end)
        vim.keymap.set("n", "<A-t>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set("n", "<A-1>", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<A-2>", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<A-3>", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<A-4>", function()
            harpoon:list():select(4)
        end)

        vim.keymap.set("n", "<A-n>", function()
            harpoon:list():next({ ui_nav_wrap = true }) -- to loop over the list
        end)
        vim.keymap.set("n", "<A-p>", function()
            harpoon:list():prev({ ui_nav_wrap = true })
        end)
    end,
}
